extern crate clap;
use clap::{App, ArgMatches};

fn init_args() -> ArgMatches<'static> {
    App::new("hurdle-cli")
        .version("0.1.0")
        .bin_name("hurdle-cli")
        .about("Hurdle CLI controller")
        .author("Dom Rodriguez <shymega@shymega.org.uk>")
        .get_matches()
}

fn main() {
    let _args = init_args();

    unimplemented!();
}
