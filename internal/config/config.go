package config

import "github.com/spf13/viper"

type Config struct {
	Port           string `mapstructure:"PORT"`
	DBUrl          string `mapstructure:"DB_URL"`
	GeocoderApiKey string `mapstructure:"GEOCODER_API_KEY"`
}

func LoadConfig() (config Config, err error) {
	viper.AddConfigPath("./internal/config/envs")
	viper.SetConfigName("dev")
	viper.SetConfigType("env")

	viper.AutomaticEnv()

	err = viper.ReadInConfig()

	if err != nil {
		return
	}

	err = viper.Unmarshal(&config)

	return
}
