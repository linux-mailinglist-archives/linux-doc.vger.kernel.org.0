Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD81A2685B8
	for <lists+linux-doc@lfdr.de>; Mon, 14 Sep 2020 09:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgINHYN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Sep 2020 03:24:13 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40612 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgINHYL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Sep 2020 03:24:11 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08E7NvdW038887;
        Mon, 14 Sep 2020 02:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600068237;
        bh=D+lYPEQrFiJDaaPV/1vUS6S6TddRl8zjLZe+HU7qefo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ji/IXfwzvuqdn4/g+5YFSK18+xteAP3vDRaRjgXpARRXpxJUmABBeW5Lb8pq0w5HM
         vqaPh+JGVVSb0dpn1UvA9kkYE5la7peruQh8zzlCe4CZpnXCnsYa0dBsepJhbpo2Ys
         03AAQ804wLvmYyQAgdy4yZWVLdmXgJPfwRYxivaQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08E7NvFg098803
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 14 Sep 2020 02:23:57 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 14
 Sep 2020 02:23:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Sep 2020 02:23:57 -0500
Received: from [10.250.232.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08E7NoVr094913;
        Mon, 14 Sep 2020 02:23:51 -0500
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
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <edf25301-93c0-4ba6-aa85-5f04137d0906@ti.com>
Date:   Mon, 14 Sep 2020 12:53:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9cd58cd1-0041-3d98-baf7-6e5bc2e7e317@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jason,

On 01/09/20 2:20 pm, Jason Wang wrote:
> 
> On 2020/9/1 下午1:24, Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On 28/08/20 4:04 pm, Cornelia Huck wrote:
>>> On Thu, 9 Jul 2020 14:26:53 +0800
>>> Jason Wang <jasowang@redhat.com> wrote:
>>>
>>> [Let me note right at the beginning that I first noted this while
>>> listening to Kishon's talk at LPC on Wednesday. I might be very
>>> confused about the background here, so let me apologize beforehand for
>>> any confusion I might spread.]
>>>
>>>> On 2020/7/8 下午9:13, Kishon Vijay Abraham I wrote:
>>>>> Hi Jason,
>>>>>
>>>>> On 7/8/2020 4:52 PM, Jason Wang wrote:
>>>>>> On 2020/7/7 下午10:45, Kishon Vijay Abraham I wrote:
>>>>>>> Hi Jason,
>>>>>>>
>>>>>>> On 7/7/2020 3:17 PM, Jason Wang wrote:
>>>>>>>> On 2020/7/6 下午5:32, Kishon Vijay Abraham I wrote:
>>>>>>>>> Hi Jason,
>>>>>>>>>
>>>>>>>>> On 7/3/2020 12:46 PM, Jason Wang wrote:
>>>>>>>>>> On 2020/7/2 下午9:35, Kishon Vijay Abraham I wrote:
>>>>>>>>>>> Hi Jason,
>>>>>>>>>>>
>>>>>>>>>>> On 7/2/2020 3:40 PM, Jason Wang wrote:
>>>>>>>>>>>> On 2020/7/2 下午5:51, Michael S. Tsirkin wrote:
>>>>>>>>>>>>> On Thu, Jul 02, 2020 at 01:51:21PM +0530, Kishon Vijay
>>>>>>>>>>>>> Abraham I wrote:
>>>>>>>>>>>>>> This series enhances Linux Vhost support to enable SoC-to-SoC
>>>>>>>>>>>>>> communication over MMIO. This series enables rpmsg
>>>>>>>>>>>>>> communication between
>>>>>>>>>>>>>> two SoCs using both PCIe RC<->EP and HOST1-NTB-HOST2
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> 1) Modify vhost to use standard Linux driver model
>>>>>>>>>>>>>> 2) Add support in vring to access virtqueue over MMIO
>>>>>>>>>>>>>> 3) Add vhost client driver for rpmsg
>>>>>>>>>>>>>> 4) Add PCIe RC driver (uses virtio) and PCIe EP driver
>>>>>>>>>>>>>> (uses vhost) for
>>>>>>>>>>>>>>          rpmsg communication between two SoCs connected to
>>>>>>>>>>>>>> each other
>>>>>>>>>>>>>> 5) Add NTB Virtio driver and NTB Vhost driver for rpmsg
>>>>>>>>>>>>>> communication
>>>>>>>>>>>>>>          between two SoCs connected via NTB
>>>>>>>>>>>>>> 6) Add configfs to configure the components
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> UseCase1 :
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>        VHOST RPMSG VIRTIO RPMSG
>>>>>>>>>>>>>> +                               +
>>>>>>>>>>>>>> |                               |
>>>>>>>>>>>>>> |                               |
>>>>>>>>>>>>>> |                               |
>>>>>>>>>>>>>> |                               |
>>>>>>>>>>>>>> +-----v------+ +------v-------+
>>>>>>>>>>>>>> |   Linux    |                 | Linux    |
>>>>>>>>>>>>>> |  Endpoint  |                 | Root Complex |
>>>>>>>>>>>>>> | <----------------->              |
>>>>>>>>>>>>>> |            | |              |
>>>>>>>>>>>>>> |    SOC1    |                 | SOC2     |
>>>>>>>>>>>>>> +------------+ +--------------+
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> UseCase 2:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>            VHOST RPMSG VIRTIO RPMSG
>>>>>>>>>>>>>> + +
>>>>>>>>>>>>>> | |
>>>>>>>>>>>>>> | |
>>>>>>>>>>>>>> | |
>>>>>>>>>>>>>> | |
>>>>>>>>>>>>>> +------v------+ +------v------+
>>>>>>>>>>>>>>          | | |             |
>>>>>>>>>>>>>>          |    HOST1 |                                   |
>>>>>>>>>>>>>> HOST2    |
>>>>>>>>>>>>>>          | | |             |
>>>>>>>>>>>>>> +------^------+ +------^------+
>>>>>>>>>>>>>> | |
>>>>>>>>>>>>>> | |
>>>>>>>>>>>>>> +---------------------------------------------------------------------+
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> | +------v------+ +------v------+  |
>>>>>>>>>>>>>> |  | | |             |  |
>>>>>>>>>>>>>> |  |     EP |                                   | EP     
>>>>>>>>>>>>>> |  |
>>>>>>>>>>>>>> |  | CONTROLLER1 |                                   |
>>>>>>>>>>>>>> CONTROLLER2 |  |
>>>>>>>>>>>>>> |  | <-----------------------------------> |  |
>>>>>>>>>>>>>> |  | | |             |  |
>>>>>>>>>>>>>> |  | | |             |  |
>>>>>>>>>>>>>> |  |             |  SoC With Multiple EP Instances  
>>>>>>>>>>>>>> |             |  |
>>>>>>>>>>>>>> |  |             |  (Configured using NTB Function) 
>>>>>>>>>>>>>> |             |  |
>>>>>>>>>>>>>> | +-------------+ +-------------+  |
>>>>>>>>>>>>>> +---------------------------------------------------------------------+
>>>>>>>>>>>>>>
>>>
>>> First of all, to clarify the terminology:
>>> Is "vhost rpmsg" acting as what the virtio standard calls the 'device',
>>> and "virtio rpmsg" as the 'driver'? Or is the "vhost" part mostly just
>>
>> Right, vhost_rpmsg is 'device' and virtio_rpmsg is 'driver'.
>>> virtqueues + the exiting vhost interfaces?
>>
>> It's implemented to provide the full 'device' functionality.
>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Software Layering:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The high-level SW layering should look something like
>>>>>>>>>>>>>> below. This series
>>>>>>>>>>>>>> adds support only for RPMSG VHOST, however something
>>>>>>>>>>>>>> similar should be
>>>>>>>>>>>>>> done for net and scsi. With that any vhost device (PCI,
>>>>>>>>>>>>>> NTB, Platform
>>>>>>>>>>>>>> device, user) can use any of the vhost client driver.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>           +----------------+ +-----------+  +------------+
>>>>>>>>>>>>>> +----------+
>>>>>>>>>>>>>>           |  RPMSG VHOST   |  | NET VHOST |  | SCSI VHOST
>>>>>>>>>>>>>> |  |    X     |
>>>>>>>>>>>>>>           +-------^--------+ +-----^-----+  +-----^------+
>>>>>>>>>>>>>> +----^-----+
>>>>>>>>>>>>>>                   | |              |              |
>>>>>>>>>>>>>>                   | |              |              |
>>>>>>>>>>>>>>                   | |              |              |
>>>>>>>>>>>>>> +-----------v-----------------v--------------v--------------v----------+
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> |                            VHOST
>>>>>>>>>>>>>> CORE                                |
>>>>>>>>>>>>>> +--------^---------------^--------------------^------------------^-----+
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>                | |                    |                  |
>>>>>>>>>>>>>>                | |                    |                  |
>>>>>>>>>>>>>>                | |                    |                  |
>>>>>>>>>>>>>> +--------v-------+  +----v------+ +----------v----------+ 
>>>>>>>>>>>>>> +----v-----+
>>>>>>>>>>>>>> |  PCI EPF VHOST |  | NTB VHOST | |PLATFORM DEVICE VHOST| 
>>>>>>>>>>>>>> |    X     |
>>>>>>>>>>>>>> +----------------+  +-----------+ +---------------------+ 
>>>>>>>>>>>>>> +----------+
>>>
>>> So, the upper half is basically various functionality types, e.g. a net
>>> device. What is the lower half, a hardware interface? Would it be
>>> equivalent to e.g. a normal PCI device?
>>
>> Right, the upper half should provide the functionality.
>> The bottom layer could be a HW interface (like PCIe device or NTB
>> device) or it could be a SW interface (for accessing virtio ring in
>> userspace) that could be used by Hypervisor.
>>
>> The top half should be transparent to what type of device is actually
>> using it.
>>
>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> This was initially proposed here [1]
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> [1] ->
>>>>>>>>>>>>>> https://lore.kernel.org/r/2cf00ec4-1ed6-f66e-6897-006d1a5b6390@ti.com
>>>>>>>>>>>>>>
>>>>>>>>>>>>> I find this very interesting. A huge patchset so will take
>>>>>>>>>>>>> a bit
>>>>>>>>>>>>> to review, but I certainly plan to do that. Thanks!
>>>>>>>>>>>> Yes, it would be better if there's a git branch for us to
>>>>>>>>>>>> have a look.
>>>>>>>>>>> I've pushed the branch
>>>>>>>>>>> https://github.com/kishon/linux-wip.git vhost_rpmsg_pci_ntb_rfc
>>>>>>>>>> Thanks
>>>>>>>>>>
>>>>>>>>>>>> Btw, I'm not sure I get the big picture, but I vaguely feel
>>>>>>>>>>>> some of the
>>>>>>>>>>>> work is
>>>>>>>>>>>> duplicated with vDPA (e.g the epf transport or vhost bus).
>>>>>>>>>>> This is about connecting two different HW systems both
>>>>>>>>>>> running Linux and
>>>>>>>>>>> doesn't necessarily involve virtualization.
>>>>>>>>>> Right, this is something similar to VOP
>>>>>>>>>> (Documentation/misc-devices/mic/mic_overview.rst). The
>>>>>>>>>> different is the
>>>>>>>>>> hardware I guess and VOP use userspace application to
>>>>>>>>>> implement the device.
>>>>>>>>> I'd also like to point out, this series tries to have
>>>>>>>>> communication between
>>>>>>>>> two
>>>>>>>>> SoCs in vendor agnostic way. Since this series solves for 2
>>>>>>>>> usecases (PCIe
>>>>>>>>> RC<->EP and NTB), for the NTB case it directly plugs into NTB
>>>>>>>>> framework and
>>>>>>>>> any
>>>>>>>>> of the HW in NTB below should be able to use a virtio-vhost
>>>>>>>>> communication
>>>>>>>>>
>>>>>>>>> #ls drivers/ntb/hw/
>>>>>>>>> amd  epf  idt  intel  mscc
>>>>>>>>>
>>>>>>>>> And similarly for the PCIe RC<->EP communication, this adds a
>>>>>>>>> generic endpoint
>>>>>>>>> function driver and hence any SoC that supports configurable
>>>>>>>>> PCIe endpoint can
>>>>>>>>> use virtio-vhost communication
>>>>>>>>>
>>>>>>>>> # ls drivers/pci/controller/dwc/*ep*
>>>>>>>>> drivers/pci/controller/dwc/pcie-designware-ep.c
>>>>>>>>> drivers/pci/controller/dwc/pcie-uniphier-ep.c
>>>>>>>>> drivers/pci/controller/dwc/pci-layerscape-ep.c
>>>>>>>> Thanks for those backgrounds.
>>>>>>>>
>>>>>>>>>>>       So there is no guest or host as in
>>>>>>>>>>> virtualization but two entirely different systems connected
>>>>>>>>>>> via PCIe cable,
>>>>>>>>>>> one
>>>>>>>>>>> acting as guest and one as host. So one system will provide
>>>>>>>>>>> virtio
>>>>>>>>>>> functionality reserving memory for virtqueues and the other
>>>>>>>>>>> provides vhost
>>>>>>>>>>> functionality providing a way to access the virtqueues in
>>>>>>>>>>> virtio memory.
>>>>>>>>>>> One is
>>>>>>>>>>> source and the other is sink and there is no intermediate
>>>>>>>>>>> entity. (vhost was
>>>>>>>>>>> probably intermediate entity in virtualization?)
>>>>>>>>>> (Not a native English speaker) but "vhost" could introduce
>>>>>>>>>> some confusion for
>>>>>>>>>> me since it was use for implementing virtio backend for
>>>>>>>>>> userspace drivers. I
>>>>>>>>>> guess "vringh" could be better.
>>>>>>>>> Initially I had named this vringh but later decided to choose
>>>>>>>>> vhost instead of
>>>>>>>>> vringh. vhost is still a virtio backend (not necessarily
>>>>>>>>> userspace) though it
>>>>>>>>> now resides in an entirely different system. Whatever virtio is
>>>>>>>>> for a frontend
>>>>>>>>> system, vhost can be that for a backend system. vring can be
>>>>>>>>> for accessing
>>>>>>>>> virtqueue and can be used either in frontend or backend.
>>>
>>> I guess that clears up at least some of my questions from above...
>>>
>>>>>>>> Ok.
>>>>>>>>
>>>>>>>>>>>> Have you considered to implement these through vDPA?
>>>>>>>>>>> IIUC vDPA only provides an interface to userspace and an
>>>>>>>>>>> in-kernel rpmsg
>>>>>>>>>>> driver
>>>>>>>>>>> or vhost net driver is not provided.
>>>>>>>>>>>
>>>>>>>>>>> The HW connection looks something like
>>>>>>>>>>> https://pasteboard.co/JfMVVHC.jpg
>>>>>>>>>>> (usecase2 above),
>>>>>>>>>> I see.
>>>>>>>>>>
>>>>>>>>>>>       all the boards run Linux. The middle board provides NTB
>>>>>>>>>>> functionality and board on either side provides virtio/vhost
>>>>>>>>>>> functionality and
>>>>>>>>>>> transfer data using rpmsg.
>>>
>>> This setup looks really interesting (sometimes, it's really hard to
>>> imagine this in the abstract.)
>>>>>>>>>> So I wonder whether it's worthwhile for a new bus. Can we use
>>>>>>>>>> the existed virtio-bus/drivers? It might work as, except for
>>>>>>>>>> the epf transport, we can introduce a epf "vhost" transport
>>>>>>>>>> driver.
>>>>>>>>> IMHO we'll need two buses one for frontend and other for
>>>>>>>>> backend because the two components can then co-operate/interact
>>>>>>>>> with each other to provide a functionality. Though both will
>>>>>>>>> seemingly provide similar callbacks, they are both provide
>>>>>>>>> symmetrical or complimentary funcitonality and need not be same
>>>>>>>>> or identical.
>>>>>>>>>
>>>>>>>>> Having the same bus can also create sequencing issues.
>>>>>>>>>
>>>>>>>>> If you look at virtio_dev_probe() of virtio_bus
>>>>>>>>>
>>>>>>>>> device_features = dev->config->get_features(dev);
>>>>>>>>>
>>>>>>>>> Now if we use same bus for both front-end and back-end, both
>>>>>>>>> will try to get_features when there has been no set_features.
>>>>>>>>> Ideally vhost device should be initialized first with the set
>>>>>>>>> of features it supports. Vhost and virtio should use "status"
>>>>>>>>> and "features" complimentarily and not identically.
>>>>>>>> Yes, but there's no need for doing status/features passthrough
>>>>>>>> in epf vhost drivers.b
>>>>>>>>
>>>>>>>>> virtio device (or frontend) cannot be initialized before vhost
>>>>>>>>> device (or backend) gets initialized with data such as
>>>>>>>>> features. Similarly vhost (backend)
>>>>>>>>> cannot access virqueues or buffers before virtio (frontend) sets
>>>>>>>>> VIRTIO_CONFIG_S_DRIVER_OK whereas that requirement is not there
>>>>>>>>> for virtio as the physical memory for virtqueues are created by
>>>>>>>>> virtio (frontend).
>>>>>>>> epf vhost drivers need to implement two devices: vhost(vringh)
>>>>>>>> device and virtio device (which is a mediated device). The
>>>>>>>> vhost(vringh) device is doing feature negotiation with the
>>>>>>>> virtio device via RC/EP or NTB. The virtio device is doing
>>>>>>>> feature negotiation with local virtio drivers. If there're
>>>>>>>> feature mismatch, epf vhost drivers and do mediation between
>>>>>>>> them.
>>>>>>> Here epf vhost should be initialized with a set of features for
>>>>>>> it to negotiate either as vhost device or virtio device no? Where
>>>>>>> should the initial feature set for epf vhost come from?
>>>>>>
>>>>>> I think it can work as:
>>>>>>
>>>>>> 1) Having an initial features (hard coded in the code) set X in
>>>>>> epf vhost 2) Using this X for both virtio device and vhost(vringh)
>>>>>> device 3) local virtio driver will negotiate with virtio device
>>>>>> with feature set Y 4) remote virtio driver will negotiate with
>>>>>> vringh device with feature set Z 5) mediate between feature Y and
>>>>>> feature Z since both Y and Z are a subset of X
>>>>>>
>>>>> okay. I'm also thinking if we could have configfs for configuring
>>>>> this. Anyways we could find different approaches of configuring
>>>>> this.
>>>>
>>>>
>>>> Yes, and I think some management API is needed even in the design of
>>>> your "Software Layering". In that figure, rpmsg vhost need some
>>>> pre-set or hard-coded features.
>>>
>>> When I saw the plumbers talk, my first idea was "this needs to be a new
>>> transport". You have some hard-coded or pre-configured features, and
>>> then features are negotiated via a transport-specific means in the
>>> usual way. There's basically an extra/extended layer for this (and
>>> status, and whatever).
>>
>> I think for PCIe root complex to PCIe endpoint communication it's
>> still "Virtio Over PCI Bus", though existing layout cannot be used in
>> this context (find virtio capability will fail for modern interface
>> and loading queue status immediately after writing queue number is not
>> possible for root complex to endpoint communication; setup_vq() in
>> virtio_pci_legacy.c).
> 
> 
> Then you need something that is functional equivalent to virtio PCI
> which is actually the concept of vDPA (e.g vDPA provides alternatives if
> the queue_sel is hard in the EP implementation).

Okay, I just tried to compare the 'struct vdpa_config_ops' and 'struct
vhost_config_ops' ( introduced in [RFC PATCH 03/22] vhost: Add ops for
the VHOST driver to configure VHOST device).

struct vdpa_config_ops {
	/* Virtqueue ops */
	int (*set_vq_address)(struct vdpa_device *vdev,
			      u16 idx, u64 desc_area, u64 driver_area,
			      u64 device_area);
	void (*set_vq_num)(struct vdpa_device *vdev, u16 idx, u32 num);
	void (*kick_vq)(struct vdpa_device *vdev, u16 idx);
	void (*set_vq_cb)(struct vdpa_device *vdev, u16 idx,
			  struct vdpa_callback *cb);
	void (*set_vq_ready)(struct vdpa_device *vdev, u16 idx, bool ready);
	bool (*get_vq_ready)(struct vdpa_device *vdev, u16 idx);
	int (*set_vq_state)(struct vdpa_device *vdev, u16 idx,
			    const struct vdpa_vq_state *state);
	int (*get_vq_state)(struct vdpa_device *vdev, u16 idx,
			    struct vdpa_vq_state *state);
	struct vdpa_notification_area
	(*get_vq_notification)(struct vdpa_device *vdev, u16 idx);
	/* vq irq is not expected to be changed once DRIVER_OK is set */
	int (*get_vq_irq)(struct vdpa_device *vdv, u16 idx);

	/* Device ops */
	u32 (*get_vq_align)(struct vdpa_device *vdev);
	u64 (*get_features)(struct vdpa_device *vdev);
	int (*set_features)(struct vdpa_device *vdev, u64 features);
	void (*set_config_cb)(struct vdpa_device *vdev,
			      struct vdpa_callback *cb);
	u16 (*get_vq_num_max)(struct vdpa_device *vdev);
	u32 (*get_device_id)(struct vdpa_device *vdev);
	u32 (*get_vendor_id)(struct vdpa_device *vdev);
	u8 (*get_status)(struct vdpa_device *vdev);
	void (*set_status)(struct vdpa_device *vdev, u8 status);
	void (*get_config)(struct vdpa_device *vdev, unsigned int offset,
			   void *buf, unsigned int len);
	void (*set_config)(struct vdpa_device *vdev, unsigned int offset,
			   const void *buf, unsigned int len);
	u32 (*get_generation)(struct vdpa_device *vdev);

	/* DMA ops */
	int (*set_map)(struct vdpa_device *vdev, struct vhost_iotlb *iotlb);
	int (*dma_map)(struct vdpa_device *vdev, u64 iova, u64 size,
		       u64 pa, u32 perm);
	int (*dma_unmap)(struct vdpa_device *vdev, u64 iova, u64 size);

	/* Free device resources */
	void (*free)(struct vdpa_device *vdev);
};

+struct vhost_config_ops {
+	int (*create_vqs)(struct vhost_dev *vdev, unsigned int nvqs,
+			  unsigned int num_bufs, struct vhost_virtqueue *vqs[],
+			  vhost_vq_callback_t *callbacks[],
+			  const char * const names[]);
+	void (*del_vqs)(struct vhost_dev *vdev);
+	int (*write)(struct vhost_dev *vdev, u64 vhost_dst, void *src, int len);
+	int (*read)(struct vhost_dev *vdev, void *dst, u64 vhost_src, int len);
+	int (*set_features)(struct vhost_dev *vdev, u64 device_features);
+	int (*set_status)(struct vhost_dev *vdev, u8 status);
+	u8 (*get_status)(struct vhost_dev *vdev);
+};
+
struct virtio_config_ops
I think there's some overlap here and some of the ops tries to do the
same thing.

I think it differs in (*set_vq_address)() and (*create_vqs)().
[create_vqs() introduced in struct vhost_config_ops provides
complimentary functionality to (*find_vqs)() in struct
virtio_config_ops. It seemingly encapsulates the functionality of
(*set_vq_address)(), (*set_vq_num)(), (*set_vq_cb)(),..].

Back to the difference between (*set_vq_address)() and (*create_vqs)(),
set_vq_address() directly provides the virtqueue address to the vdpa
device but create_vqs() only provides the parameters of the virtqueue
(like the number of virtqueues, number of buffers) but does not directly
provide the address. IMO the backend client drivers (like net or vhost)
shouldn't/cannot by itself know how to access the vring created on
virtio front-end. The vdpa device/vhost device should have logic for
that. That will help the client drivers to work with different types of
vdpa device/vhost device and can access the vring created by virtio
irrespective of whether the vring can be accessed via mmio or kernel
space or user space.

I think vdpa always works with client drivers in userspace and providing
userspace address for vring.
> 
> 
>>
>> "Virtio Over NTB" should anyways be a new transport.
>>>
>>> Does that make any sense?
>>
>> yeah, in the approach I used the initial features are hard-coded in
>> vhost-rpmsg (inherent to the rpmsg) but when we have to use adapter
>> layer (vhost only for accessing virtio ring and use virtio drivers on
>> both front end and backend), based on the functionality (e.g, rpmsg),
>> the vhost should be configured with features (to be presented to the
>> virtio) and that's why additional layer or APIs will be required.
> 
> 
> A question here, if we go with vhost bus approach, does it mean the
> virtio device can only be implemented in EP's userspace?

The vhost bus approach doesn't provide any restriction in where the
virto backend device should be created. This series creates two types of
virtio backend device (one for PCIe endpoint and the other for NTB) and
both these devices are created in kernel.

Thanks
Kishon

> 
> Thanks
> 
> 
>>>
>>>>
>>>>
>>>>>>>>>> It will have virtqueues but only used for the communication
>>>>>>>>>> between itself and
>>>>>>>>>> uppter virtio driver. And it will have vringh queues which
>>>>>>>>>> will be probe by virtio epf transport drivers. And it needs to
>>>>>>>>>> do datacopy between virtqueue and
>>>>>>>>>> vringh queues.
>>>>>>>>>>
>>>>>>>>>> It works like:
>>>>>>>>>>
>>>>>>>>>> virtio drivers <- virtqueue/virtio-bus -> epf vhost drivers <-
>>>>>>>>>> vringh queue/epf>
>>>>>>>>>>
>>>>>>>>>> The advantages is that there's no need for writing new buses
>>>>>>>>>> and drivers.
>>>>>>>>> I think this will work however there is an addtional copy
>>>>>>>>> between vringh queue and virtqueue,
>>>>>>>> I think not? E.g in use case 1), if we stick to virtio bus, we
>>>>>>>> will have:
>>>>>>>>
>>>>>>>> virtio-rpmsg (EP) <- virtio ring(1) -> epf vhost driver (EP) <-
>>>>>>>> virtio ring(2) -> virtio pci (RC) <-> virtio rpmsg (RC)
>>>>>>> IIUC epf vhost driver (EP) will access virtio ring(2) using
>>>>>>> vringh?
>>>>>>
>>>>>> Yes.
>>>>>>
>>>>>>> And virtio
>>>>>>> ring(2) is created by virtio pci (RC).
>>>>>>
>>>>>> Yes.
>>>>>>
>>>>>>>> What epf vhost driver did is to read from virtio ring(1) about
>>>>>>>> the buffer len and addr and them DMA to Linux(RC)?
>>>>>>> okay, I made some optimization here where vhost-rpmsg using a
>>>>>>> helper writes a buffer from rpmsg's upper layer directly to
>>>>>>> remote Linux (RC) as against here were it has to be first written
>>>>>>> to virtio ring (1).
>>>>>>>
>>>>>>> Thinking how this would look for NTB
>>>>>>> virtio-rpmsg (HOST1) <- virtio ring(1) -> NTB(HOST1) <->
>>>>>>> NTB(HOST2)  <- virtio ring(2) -> virtio-rpmsg (HOST2)
>>>>>>>
>>>>>>> Here the NTB(HOST1) will access the virtio ring(2) using vringh?
>>>>>>
>>>>>> Yes, I think so it needs to use vring to access virtio ring (1) as
>>>>>> well.
>>>>> NTB(HOST1) and virtio ring(1) will be in the same system. So it
>>>>> doesn't have to use vring. virtio ring(1) is by the virtio device
>>>>> the NTB(HOST1) creates.
>>>>
>>>>
>>>> Right.
>>>>
>>>>
>>>>>>> Do you also think this will work seamlessly with virtio_net.c,
>>>>>>> virtio_blk.c?
>>>>>>
>>>>>> Yes.
>>>>> okay, I haven't looked at this but the backend of virtio_blk should
>>>>> access an actual storage device no?
>>>>
>>>>
>>>> Good point, for non-peer device like storage. There's probably no
>>>> need for it to be registered on the virtio bus and it might be better
>>>> to behave as you proposed.
>>>
>>> I might be missing something; but if you expose something as a block
>>> device, it should have something it can access with block reads/writes,
>>> shouldn't it? Of course, that can be a variety of things.
>>>
>>>>
>>>> Just to make sure I understand the design, how is VHOST SCSI expected
>>>> to work in your proposal, does it have a device for file as a backend?
>>>>
>>>>
>>>>>>> I'd like to get clarity on two things in the approach you
>>>>>>> suggested, one is features (since epf vhost should ideally be
>>>>>>> transparent to any virtio driver)
>>>>>>
>>>>>> We can have have an array of pre-defined features indexed by
>>>>>> virtio device id in the code.
>>>>>>
>>>>>>> and the other is how certain inputs to virtio device such as
>>>>>>> number of buffers be determined.
>>>>>>
>>>>>> We can start from hard coded the value like 256, or introduce some
>>>>>> API for user to change the value.
>>>>>>
>>>>>>> Thanks again for your suggestions!
>>>>>>
>>>>>> You're welcome.
>>>>>>
>>>>>> Note that I just want to check whether or not we can reuse the
>>>>>> virtio bus/driver. It's something similar to what you proposed in
>>>>>> Software Layering but we just replace "vhost core" with "virtio
>>>>>> bus" and move the vhost core below epf/ntb/platform transport.
>>>>> Got it. My initial design was based on my understanding of your
>>>>> comments [1].
>>>>
>>>>
>>>> Yes, but that's just for a networking device. If we want something
>>>> more generic, it may require more thought (bus etc).
>>>
>>> I believe that we indeed need something bus-like to be able to support
>>> a variety of devices.
>>
>> I think we could still have adapter layers for different types of
>> devices ([1]) and use existing virtio bus for both front end and back
>> end. Using bus-like will however simplify adding support for new types
>> of devices and adding adapters for devices will be slightly more complex.
>>
>> [1] -> Page 13 in
>> https://linuxplumbersconf.org/event/7/contributions/849/attachments/642/1175/Virtio_for_PCIe_RC_EP_NTB.pdf
>>
>>>
>>>>
>>>>
>>>>>
>>>>> I'll try to create something based on your proposed design here.
>>>>
>>>>
>>>> Sure, but for coding, we'd better wait for other's opinion here.
>>>
>>> Please tell me if my thoughts above make any sense... I have just
>>> started looking at that, so I might be completely off.
>>
>> I think your understanding is correct! Thanks for your inputs.
>>
>> Thanks
>> Kishon
> 
