Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7448126C8C5
	for <lists+linux-doc@lfdr.de>; Wed, 16 Sep 2020 20:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbgIPS5Y (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Sep 2020 14:57:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42674 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbgIPS5B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Sep 2020 14:57:01 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08GBlfvq027172;
        Wed, 16 Sep 2020 06:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600256861;
        bh=3AGiro3FnSBmxJs2uBGM1pA1oOZ6S/GI8y/Cm28nbw4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=IfP1zphgUN6Zw2XJNKhMMVG/ylE5qbF4CVR+eQjef20EE7290yM6Ev4B5FFBMsmUF
         rfNfsVNlbINmL9HkKfqTMRzWqWK2vxDVPch5F2rlPfFI1NZ3OrWXYFNS8daLeRbE2a
         bTE2BrjGT8jdqaBADcJk3RiseeaORT6KKSxI2z5w=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08GBlfhS000950
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Sep 2020 06:47:41 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 16
 Sep 2020 06:47:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 16 Sep 2020 06:47:41 -0500
Received: from [10.250.232.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08GBlXSA024715;
        Wed, 16 Sep 2020 06:47:34 -0500
Subject: Re: [RFC PATCH 00/22] Enhance VHOST to enable SoC-to-SoC
 communication
To:     Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>
CC:     "Michael S. Tsirkin" <mst@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jon Mason <jdmason@kudzu.us>,
        Dave Jiang <dave.jiang@intel.com>,
        Allen Hubbe <allenbh@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Stefano Garzarella <sgarzare@redhat.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-ntb@googlegroups.com>,
        <linux-pci@vger.kernel.org>, <kvm@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>,
        <netdev@vger.kernel.org>
References: <20200702082143.25259-1-kishon@ti.com>
 <20200702055026-mutt-send-email-mst@kernel.org>
 <603970f5-3289-cd53-82a9-aa62b292c552@redhat.com>
 <14c6cad7-9361-7fa4-e1c6-715ccc7e5f6b@ti.com>
 <59fd6a0b-8566-44b7-3dae-bb52b468219b@redhat.com>
 <ce9eb6a5-cd3a-a390-5684-525827b30f64@ti.com>
 <da2b671c-b05d-a57f-7bdf-8b1043a41240@redhat.com>
 <fee8a0fb-f862-03bd-5ede-8f105b6af529@ti.com>
 <b2178e1d-2f5c-e8a3-72fb-70f2f8d6aa45@redhat.com>
 <45a8a97c-2061-13ee-5da8-9877a4a3b8aa@ti.com>
 <c8739d7f-e12e-f6a2-7018-9eeaf6feb054@redhat.com>
 <20200828123409.4cd2a812.cohuck@redhat.com>
 <ac8f7e4f-9f46-919a-f5c2-89b07794f0ab@ti.com>
 <9cd58cd1-0041-3d98-baf7-6e5bc2e7e317@redhat.com>
 <edf25301-93c0-4ba6-aa85-5f04137d0906@ti.com>
 <5733dbfc-76c1-45dc-6dce-ef5449eacc73@redhat.com>
 <181ae83d-edeb-9406-27cc-1195fe29ae95@ti.com>
 <ee0aa81d-064b-d7a7-86bb-79a3f4d3dd11@redhat.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <67924594-c70e-390e-ce2e-dda41a94ada1@ti.com>
Date:   Wed, 16 Sep 2020 17:17:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ee0aa81d-064b-d7a7-86bb-79a3f4d3dd11@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jason,

On 16/09/20 8:40 am, Jason Wang wrote:
> 
> On 2020/9/15 下午11:47, Kishon Vijay Abraham I wrote:
>> Hi Jason,
>>
>> On 15/09/20 1:48 pm, Jason Wang wrote:
>>> Hi Kishon:
>>>
>>> On 2020/9/14 下午3:23, Kishon Vijay Abraham I wrote:
>>>>> Then you need something that is functional equivalent to virtio PCI
>>>>> which is actually the concept of vDPA (e.g vDPA provides
>>>>> alternatives if
>>>>> the queue_sel is hard in the EP implementation).
>>>> Okay, I just tried to compare the 'struct vdpa_config_ops' and 'struct
>>>> vhost_config_ops' ( introduced in [RFC PATCH 03/22] vhost: Add ops for
>>>> the VHOST driver to configure VHOST device).
>>>>
>>>> struct vdpa_config_ops {
>>>>      /* Virtqueue ops */
>>>>      int (*set_vq_address)(struct vdpa_device *vdev,
>>>>                    u16 idx, u64 desc_area, u64 driver_area,
>>>>                    u64 device_area);
>>>>      void (*set_vq_num)(struct vdpa_device *vdev, u16 idx, u32 num);
>>>>      void (*kick_vq)(struct vdpa_device *vdev, u16 idx);
>>>>      void (*set_vq_cb)(struct vdpa_device *vdev, u16 idx,
>>>>                struct vdpa_callback *cb);
>>>>      void (*set_vq_ready)(struct vdpa_device *vdev, u16 idx, bool
>>>> ready);
>>>>      bool (*get_vq_ready)(struct vdpa_device *vdev, u16 idx);
>>>>      int (*set_vq_state)(struct vdpa_device *vdev, u16 idx,
>>>>                  const struct vdpa_vq_state *state);
>>>>      int (*get_vq_state)(struct vdpa_device *vdev, u16 idx,
>>>>                  struct vdpa_vq_state *state);
>>>>      struct vdpa_notification_area
>>>>      (*get_vq_notification)(struct vdpa_device *vdev, u16 idx);
>>>>      /* vq irq is not expected to be changed once DRIVER_OK is set */
>>>>      int (*get_vq_irq)(struct vdpa_device *vdv, u16 idx);
>>>>
>>>>      /* Device ops */
>>>>      u32 (*get_vq_align)(struct vdpa_device *vdev);
>>>>      u64 (*get_features)(struct vdpa_device *vdev);
>>>>      int (*set_features)(struct vdpa_device *vdev, u64 features);
>>>>      void (*set_config_cb)(struct vdpa_device *vdev,
>>>>                    struct vdpa_callback *cb);
>>>>      u16 (*get_vq_num_max)(struct vdpa_device *vdev);
>>>>      u32 (*get_device_id)(struct vdpa_device *vdev);
>>>>      u32 (*get_vendor_id)(struct vdpa_device *vdev);
>>>>      u8 (*get_status)(struct vdpa_device *vdev);
>>>>      void (*set_status)(struct vdpa_device *vdev, u8 status);
>>>>      void (*get_config)(struct vdpa_device *vdev, unsigned int offset,
>>>>                 void *buf, unsigned int len);
>>>>      void (*set_config)(struct vdpa_device *vdev, unsigned int offset,
>>>>                 const void *buf, unsigned int len);
>>>>      u32 (*get_generation)(struct vdpa_device *vdev);
>>>>
>>>>      /* DMA ops */
>>>>      int (*set_map)(struct vdpa_device *vdev, struct vhost_iotlb
>>>> *iotlb);
>>>>      int (*dma_map)(struct vdpa_device *vdev, u64 iova, u64 size,
>>>>                 u64 pa, u32 perm);
>>>>      int (*dma_unmap)(struct vdpa_device *vdev, u64 iova, u64 size);
>>>>
>>>>      /* Free device resources */
>>>>      void (*free)(struct vdpa_device *vdev);
>>>> };
>>>>
>>>> +struct vhost_config_ops {
>>>> +    int (*create_vqs)(struct vhost_dev *vdev, unsigned int nvqs,
>>>> +              unsigned int num_bufs, struct vhost_virtqueue *vqs[],
>>>> +              vhost_vq_callback_t *callbacks[],
>>>> +              const char * const names[]);
>>>> +    void (*del_vqs)(struct vhost_dev *vdev);
>>>> +    int (*write)(struct vhost_dev *vdev, u64 vhost_dst, void *src,
>>>> int len);
>>>> +    int (*read)(struct vhost_dev *vdev, void *dst, u64 vhost_src, int
>>>> len);
>>>> +    int (*set_features)(struct vhost_dev *vdev, u64 device_features);
>>>> +    int (*set_status)(struct vhost_dev *vdev, u8 status);
>>>> +    u8 (*get_status)(struct vhost_dev *vdev);
>>>> +};
>>>> +
>>>> struct virtio_config_ops
>>>> I think there's some overlap here and some of the ops tries to do the
>>>> same thing.
>>>>
>>>> I think it differs in (*set_vq_address)() and (*create_vqs)().
>>>> [create_vqs() introduced in struct vhost_config_ops provides
>>>> complimentary functionality to (*find_vqs)() in struct
>>>> virtio_config_ops. It seemingly encapsulates the functionality of
>>>> (*set_vq_address)(), (*set_vq_num)(), (*set_vq_cb)(),..].
>>>>
>>>> Back to the difference between (*set_vq_address)() and (*create_vqs)(),
>>>> set_vq_address() directly provides the virtqueue address to the vdpa
>>>> device but create_vqs() only provides the parameters of the virtqueue
>>>> (like the number of virtqueues, number of buffers) but does not
>>>> directly
>>>> provide the address. IMO the backend client drivers (like net or vhost)
>>>> shouldn't/cannot by itself know how to access the vring created on
>>>> virtio front-end. The vdpa device/vhost device should have logic for
>>>> that. That will help the client drivers to work with different types of
>>>> vdpa device/vhost device and can access the vring created by virtio
>>>> irrespective of whether the vring can be accessed via mmio or kernel
>>>> space or user space.
>>>>
>>>> I think vdpa always works with client drivers in userspace and
>>>> providing
>>>> userspace address for vring.
>>>
>>> Sorry for being unclear. What I meant is not replacing vDPA with the
>>> vhost(bus) you proposed but the possibility of replacing virtio-pci-epf
>>> with vDPA in:
>> Okay, so the virtio back-end still use vhost and front end should use
>> vDPA. I see. So the host side PCI driver for EPF should populate
>> vdpa_config_ops and invoke vdpa_register_device().
> 
> 
> Yes.
> 
> 
>>> My question is basically for the part of virtio_pci_epf_send_command(),
>>> so it looks to me you have a vendor specific API to replace the
>>> virtio-pci layout of the BAR:
>> Even when we use vDPA, we have to use some sort of
>> virtio_pci_epf_send_command() to communicate with virtio backend right?
> 
> 
> Right.
> 
> 
>>
>> Right, the layout is slightly different from the standard layout.
>>
>> This is the layout
>> struct epf_vhost_reg_queue {
>>          u8 cmd;
>>          u8 cmd_status;
>>          u16 status;
>>          u16 num_buffers;
>>          u16 msix_vector;
>>          u64 queue_addr;
> 
> 
> What's the meaning of queue_addr here?

Using queue_addr, the virtio front-end communicates the address of the
allocated memory for virtqueue to the virtio back-end.
> 
> Does not mean the device expects a contiguous memory for avail/desc/used
> ring?

It's contiguous memory. Isn't this similar to other virtio transport
(both PCI legacy and modern interface)?.
> 
> 
>> } __packed;
>>
>> struct epf_vhost_reg {
>>          u64 host_features;
>>          u64 guest_features;
>>          u16 msix_config;
>>          u16 num_queues;
>>          u8 device_status;
>>          u8 config_generation;
>>          u32 isr;
>>          u8 cmd;
>>          u8 cmd_status;
>>          struct epf_vhost_reg_queue vq[MAX_VQS];
>> } __packed;
>>>
>>> +static int virtio_pci_epf_send_command(struct virtio_pci_device
>>> *vp_dev,
>>> +                       u32 command)
>>> +{
>>> +    struct virtio_pci_epf *pci_epf;
>>> +    void __iomem *ioaddr;
>>> +    ktime_t timeout;
>>> +    bool timedout;
>>> +    int ret = 0;
>>> +    u8 status;
>>> +
>>> +    pci_epf = to_virtio_pci_epf(vp_dev);
>>> +    ioaddr = vp_dev->ioaddr;
>>> +
>>> +    mutex_lock(&pci_epf->lock);
>>> +    writeb(command, ioaddr + HOST_CMD);
>>> +    timeout = ktime_add_ms(ktime_get(), COMMAND_TIMEOUT);
>>> +    while (1) {
>>> +        timedout = ktime_after(ktime_get(), timeout);
>>> +        status = readb(ioaddr + HOST_CMD_STATUS);
>>> +
>>>
>>> Several questions:
>>>
>>> - It's not clear to me how the synchronization is done between the RC
>>> and EP. E.g how and when the value of HOST_CMD_STATUS can be changed.
>> The HOST_CMD (commands sent to the EP) is serialized by using mutex.
>> Once the EP reads the command, it resets the value in HOST_CMD. So
>> HOST_CMD is less likely an issue.
> 
> 
> Here's my understanding of the protocol:
> 
> 1) RC write to HOST_CMD
> 2) RC wait for HOST_CMD_STATUS to be HOST_CMD_STATUS_OKAY

That's right!
> 
> It looks to me what EP should do is
> 
> 1) EP reset HOST_CMD after reading new command

That's right! It does.
> 
> And it looks to me EP should also reset HOST_CMD_STATUS here?

yeah, that would require RC to send another command to reset the status.
Didn't see it required in the normal scenario but good to add this.
> 
> (I thought there should be patch to handle stuffs like this but I didn't
> find it in this series)

This is added in [RFC PATCH 19/22] PCI: endpoint: Add EP function driver
to provide VHOST interface

pci_epf_vhost_cmd_handler() gets commands from RC using "reg->cmd;". On
the EP side, it is local memory access (mapped to BAR memory exposed to
the host) and hence accessed using structure member access.
> 
> 
>>
>> A sufficiently large time is given for the EP to complete it's operation
>> (1 Sec) where the EP provides the status in HOST_CMD_STATUS. After it
>> expires, HOST_CMD_STATUS_NONE is written to HOST_CMD_STATUS. There could
>> be case where EP updates HOST_CMD_STATUS after RC writes
>> HOST_CMD_STATUS_NONE, but by then HOST has already detected this as
>> failure and error-ed out.
>>  
>>> If you still want to introduce a new transport, a virtio spec patch
>>> would be helpful for us to understand the device API.
>> Okay, that should be on https://github.com/oasis-tcs/virtio-spec.git?
> 
> 
> Yes.
> 
> 
>>> - You have you vendor specific layout (according to
>>> virtio_pci_epb_table()), so I guess you it's better to have a vendor
>>> specific vDPA driver instead
>> Okay, with vDPA, we are free to define our own layouts.
> 
> 
> Right, but vDPA have other requirements. E.g it requires the device have
> the ability to save/restore the state (e.g the last_avail_idx).
> 
> So it actually depends on what you want. If you don't care about
> userspace drivers and want to have a standard transport, you can still
> go virtio.

okay.
> 
> 
>>> - The advantage of vendor specific vDPA driver is that it can 1) have
>>> less codes 2) support userspace drivers through vhost-vDPA (instead of
>>> inventing new APIs since we can't use vfio-pci here).
>> I see there's an additional level of indirection from virtio to vDPA and
>> probably no need for spec update but don't exactly see how it'll reduce
>> code.
> 
> 
> AFAIK you don't need to implement your own setup_vq and del_vq.
> 
There should still be some entity that allocates memory for virtqueues
and then communicate this address to the backend.

Maybe I have to look this further.
> 
>>
>> For 2, Isn't vhost-vdpa supposed to run on virtio backend?
> 
> 
> Not currently, vDPA is a superset of virtio (e.g it support virtqueue
> state save/restore). This it should be possible in the future probably.
> 
> 
>>
>>  From a high level, I think I should be able to use vDPA for
>> virtio_pci_epf.c. Would you also suggest using vDPA for ntb_virtio.c?
>> ([RFC PATCH 20/22] NTB: Add a new NTB client driver to implement VIRTIO
>> functionality).
> 
> 
> I think it's your call. If you want
> 
> 1) a well-defined standard virtio transport
> 2) willing to finalize d and maintain the spec
> 3) doesn't care about userspace drivers

IIUC, we can use vDPA (virtio_vdpa.c) but still don't need userspace
drivers right?
> 
> You can go with virtio, otherwise vDPA.

Okay, let me see. Thanks for your inputs.

Best Regards,
Kishon
