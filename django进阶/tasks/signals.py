from django.dispatch import Signal, receiver

my_signal = Signal()


@receiver(my_signal)
def my_signal_callback(sender, **kwargs):
    print(kwargs['msg'])
