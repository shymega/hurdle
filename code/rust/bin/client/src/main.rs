extern crate clap;
use clap::{App, ArgMatches};

fn init_args() -> ArgMatches<'static> {
    App::new("hurdlec")
        .version("0.1.0")
        .bin_name("hurdlec")
        .about("Hurdle client daemon")
        .author("Dom Rodriguez <shymega@shymega.org.uk>")
        .get_matches()
}

fn main() {
    let _args = init_args();

    unimplemented!();
}
