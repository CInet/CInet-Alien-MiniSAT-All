requires 'IPC::Run3';
requires 'File::Spec::Functions';

on 'test' => sub {
    requires 'Test::More';
    requires 'Test::Alien';
};
