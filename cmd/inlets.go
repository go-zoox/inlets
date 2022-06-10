package main

import (
	"os"

	"github.com/go-zoox/logger"
	"github.com/go-zoox/tcp-proxy/forward"
	"github.com/urfave/cli/v2"
)

func main() {
	app := &cli.App{
		Name:        "inlets",
		Usage:       "inlets tcp proxy",
		Description: "inlets tcp proxy",
		Version:     "0.0.1",
		Commands: []*cli.Command{
			{
				Name:  "forward",
				Usage: "forward tcp proxy",
				Flags: []cli.Flag{
					&cli.StringFlag{
						Name:     "source",
						Usage:    "source address",
						Aliases:  []string{"s"},
						Required: true,
					},
					&cli.StringFlag{
						Name:     "target",
						Usage:    "target address",
						Aliases:  []string{"t"},
						Required: true,
					},
				},
				Action: func(c *cli.Context) error {
					forward.New(c.String("source"), c.String("target")).Start()
					return nil
				},
			},
		},
	}

	if err := app.Run(os.Args); err != nil {
		logger.Fatal("%s", err.Error())
	}
}
