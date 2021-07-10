
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 25)
#include <linux/usb/usbnet.h>
#else
#include <../drivers/usb/net/usbnet.h>
#endif

#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)
#include <linux/linkmode.h>
#endif

#if LINUX_VERSION_CODE <= KERNEL_VERSION(2, 6, 10)
typedef u32 pm_message_t;
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 12, 0)
#define usbnet_get_stats64 NULL
#endif

#ifndef RHEL_RELEASE_VERSION
#define RHEL_RELEASE_VERSION(a,b) (((a) << 8) + (b))
#endif

#ifndef RHEL_RELEASE_CODE
#define RHEL_RELEASE_CODE 0
#endif


#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 8, 0)
int usbnet_read_cmd(struct usbnet *dev, u8 cmd, u8 reqtype, u16 value, u16 index,
		    void *data, u16 size)
{
	return usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
			       cmd, reqtype, value, index, data, size,
			       USB_CTRL_GET_TIMEOUT);
}

int usbnet_read_cmd_nopm(struct usbnet *dev, u8 cmd, u8 reqtype, u16 value,
			 u16 index, void *data, u16 size)
{
	 return usbnet_read_cmd(dev, cmd, reqtype, value,
				index, data, size);
}
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0)
#define SPEED_5000 5000
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 16, 0)
#define usbnet_set_skb_tx_stats(skb, packets, bytes_delta)
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 10, 0) && !(RHEL_RELEASE_CODE)
static inline void ether_addr_copy(u8 *dst, const u8 *src)
{
	u16 *a = (u16 *)dst;
	const u16 *b = (const u16 *)src;

	a[0] = b[0];
	a[1] = b[1];
	a[2] = b[2];
}
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 20, 0) && \
    LINUX_VERSION_CODE >= KERNEL_VERSION(4, 6, 0)
static inline void linkmode_copy(unsigned long *dst, const unsigned long *src)
{
	bitmap_copy(dst, src, __ETHTOOL_LINK_MODE_MASK_NBITS);
}
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 13, 0)
#if !(RHEL_RELEASE_CODE) || RHEL_RELEASE_CODE < RHEL_RELEASE_VERSION(7,5)
static inline void *skb_put_data(struct sk_buff *skb, const void *data,
				 unsigned int len)
{
	void *tmp = skb_put(skb, len);

	memcpy(tmp, data, len);

	return tmp;
}
#endif
#endif
