Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157C028CD3D
	for <lists+linux-doc@lfdr.de>; Tue, 13 Oct 2020 13:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgJML6N (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 13 Oct 2020 07:58:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:57942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727561AbgJMLyq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:46 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D878B22400;
        Tue, 13 Oct 2020 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=hqvyr8lXdvIBi2UNaGPW4l3iT7ddrdyd24TzQLuChpU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vCjDOKKBo9EbuMmYaI5Zqs/EfhbWDHdZj4HA9nZ715njENp/7HAjkgsXIWpAA9WI6
         Yac5sRXag/uqRGN/ylv5yk1RtDCBB2MdoSclKSPyfEILjs7WSUTeUamVWbOjfh8nDg
         AGrkn9q4opDPqCrXEmYex4YxY4AKk5RD8sc4ql/Q=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt4-006CUp-N9; Tue, 13 Oct 2020 13:54:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v6 37/80] docs: sound: writing-an-alsa-driver.rst: get rid of :c:type
Date:   Tue, 13 Oct 2020 13:53:52 +0200
Message-Id: <dd2268b8e6c088c7978783a807528ae0444a5a06.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

the :c:type shouldn't be used with structs with Sphinx 3,
as the C domain there uses .. c:struct for structs.

As we have the automarkup extension, let's just get rid of
all :c:type as a whole, as those will be automagically
marked as such.

This solves a bunch of warnings with Sphinx 3, like those:

	.../Documentation/sound/kernel-api/writing-an-alsa-driver.rst:490: WARNING: Unparseable C cross-reference: 'calling snd_card_free'
	Invalid C declaration: Expected end of definition. [error at 8]
	  calling snd_card_free
	  --------^
	.../Documentation/sound/kernel-api/writing-an-alsa-driver.rst:3328: WARNING: Unparseable C cross-reference: 'snd_rawmidi_transmit*'
	Invalid C declaration: Expected end of definition. [error at 20]
	  snd_rawmidi_transmit*
	  --------------------^
	.../Documentation/sound/kernel-api/writing-an-alsa-driver.rst:3928: WARNING: Unparseable C cross-reference: 'copy_from/to_user'
	Invalid C declaration: Expected end of definition. [error at 9]
	  copy_from/to_user
	  ---------^

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../kernel-api/writing-an-alsa-driver.rst     | 105 ++++++++----------
 1 file changed, 47 insertions(+), 58 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index aa9d5ab183d2..85d6e9c643ef 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -194,7 +194,7 @@ The minimum flow for PCI soundcards is as follows:
 
 -  create ``remove`` callback.
 
--  create a :c:type:`struct pci_driver <pci_driver>` structure
+-  create a struct pci_driver structure
    containing the three pointers above.
 
 -  create an ``init`` function just calling the
@@ -487,7 +487,7 @@ The destructor, remove callback, simply releases the card instance. Then
 the ALSA middle layer will release all the attached components
 automatically.
 
-It would be typically just :c:func:`calling snd_card_free()`:
+It would be typically just calling :c:func:`snd_card_free()`:
 
 ::
 
@@ -560,16 +560,15 @@ return the card instance. The extra_size argument is used to allocate
 card->private_data for the chip-specific data. Note that these data are
 allocated by :c:func:`snd_card_new()`.
 
-The first argument, the pointer of struct :c:type:`struct device
-<device>`, specifies the parent device. For PCI devices, typically
-``&pci->`` is passed there.
+The first argument, the pointer of struct device, specifies the parent
+device. For PCI devices, typically ``&pci->`` is passed there.
 
 Components
 ----------
 
 After the card is created, you can attach the components (devices) to
 the card instance. In an ALSA driver, a component is represented as a
-:c:type:`struct snd_device <snd_device>` object. A component
+struct snd_device object. A component
 can be a PCM instance, a control interface, a raw MIDI interface, etc.
 Each such instance has one component entry.
 
@@ -628,7 +627,7 @@ argument of :c:func:`snd_card_new()`, i.e.
   err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
                      sizeof(struct mychip), &card);
 
-:c:type:`struct mychip <mychip>` is the type of the chip record.
+struct mychip is the type of the chip record.
 
 In return, the allocated record can be accessed as
 
@@ -890,7 +889,7 @@ functions.  These resources must be released in the destructor
 function (see below).
 
 Now assume that the PCI device has an I/O port with 8 bytes and an
-interrupt. Then :c:type:`struct mychip <mychip>` will have the
+interrupt. Then struct mychip will have the
 following fields:
 
 ::
@@ -1094,7 +1093,7 @@ PCI Entries
 -----------
 
 So far, so good. Let's finish the missing PCI stuff. At first, we need a
-:c:type:`struct pci_device_id <pci_device_id>` table for
+struct pci_device_id table for
 this chipset. It's a table of PCI vendor/device ID number, and some
 masks.
 
@@ -1110,19 +1109,17 @@ For example,
   };
   MODULE_DEVICE_TABLE(pci, snd_mychip_ids);
 
-The first and second fields of the :c:type:`struct pci_device_id
-<pci_device_id>` structure are the vendor and device IDs. If you
-have no reason to filter the matching devices, you can leave the
-remaining fields as above. The last field of the :c:type:`struct
-pci_device_id <pci_device_id>` struct contains private data
-for this entry. You can specify any value here, for example, to define
-specific operations for supported device IDs. Such an example is found
-in the intel8x0 driver.
+The first and second fields of the struct pci_device_id are the vendor
+and device IDs. If you have no reason to filter the matching devices, you can
+leave the remaining fields as above. The last field of the
+struct pci_device_id contains private data for this entry. You can specify
+any value here, for example, to define specific operations for supported
+device IDs. Such an example is found in the intel8x0 driver.
 
 The last entry of this list is the terminator. You must specify this
 all-zero entry.
 
-Then, prepare the :c:type:`struct pci_driver <pci_driver>`
+Then, prepare the struct pci_driver
 record:
 
 ::
@@ -1439,8 +1436,8 @@ corresponding argument.
 If a chip supports multiple playbacks or captures, you can specify more
 numbers, but they must be handled properly in open/close, etc.
 callbacks. When you need to know which substream you are referring to,
-then it can be obtained from :c:type:`struct snd_pcm_substream
-<snd_pcm_substream>` data passed to each callback as follows:
+then it can be obtained from struct snd_pcm_substream data passed to each
+callback as follows:
 
 ::
 
@@ -1639,10 +1636,9 @@ In the sections below, important records are explained.
 Hardware Description
 ~~~~~~~~~~~~~~~~~~~~
 
-The hardware descriptor (:c:type:`struct snd_pcm_hardware
-<snd_pcm_hardware>`) contains the definitions of the fundamental
-hardware configuration. Above all, you'll need to define this in the
-`PCM open callback`_. Note that the runtime instance holds the copy of
+The hardware descriptor (struct snd_pcm_hardware) contains the definitions of
+the fundamental hardware configuration. Above all, you'll need to define this
+in the `PCM open callback`_. Note that the runtime instance holds the copy of
 the descriptor, not the pointer to the existing descriptor. That is,
 in the open callback, you can modify the copied descriptor
 (``runtime->hw``) as you need. For example, if the maximum number of
@@ -1800,14 +1796,13 @@ Running Status
 ~~~~~~~~~~~~~~
 
 The running status can be referred via ``runtime->status``. This is
-the pointer to the :c:type:`struct snd_pcm_mmap_status
-<snd_pcm_mmap_status>` record. For example, you can get the current
+the pointer to the struct snd_pcm_mmap_status record.
+For example, you can get the current
 DMA hardware pointer via ``runtime->status->hw_ptr``.
 
 The DMA application pointer can be referred via ``runtime->control``,
-which points to the :c:type:`struct snd_pcm_mmap_control
-<snd_pcm_mmap_control>` record. However, accessing directly to
-this value is not recommended.
+which points to the struct snd_pcm_mmap_control record.
+However, accessing directly to this value is not recommended.
 
 Private Data
 ~~~~~~~~~~~~
@@ -1843,8 +1838,8 @@ error number such as ``-EINVAL``. To choose an appropriate error
 number, it is advised to check what value other parts of the kernel
 return when the same kind of request fails.
 
-The callback function takes at least the argument with :c:type:`struct
-snd_pcm_substream <snd_pcm_substream>` pointer. To retrieve the chip
+The callback function takes at least the argument with
+struct snd_pcm_substream pointer. To retrieve the chip
 record from the given substream instance, you can use the following
 macro.
 
@@ -2313,10 +2308,10 @@ non-atomic contexts. For example, the function
 :c:func:`snd_pcm_period_elapsed()` is called typically from the
 interrupt handler. But, if you set up the driver to use a threaded
 interrupt handler, this call can be in non-atomic context, too. In such
-a case, you can set ``nonatomic`` filed of :c:type:`struct snd_pcm
-<snd_pcm>` object after creating it. When this flag is set, mutex
-and rwsem are used internally in the PCM core instead of spin and
-rwlocks, so that you can call all PCM functions safely in a non-atomic
+a case, you can set ``nonatomic`` filed of struct snd_pcm object
+after creating it. When this flag is set, mutex and rwsem are used internally
+in the PCM core instead of spin and rwlocks, so that you can call all PCM
+functions safely in a non-atomic
 context.
 
 Constraints
@@ -2357,8 +2352,7 @@ There are many different constraints. Look at ``sound/pcm.h`` for a
 complete list. You can even define your own constraint rules. For
 example, let's suppose my_chip can manage a substream of 1 channel if
 and only if the format is ``S16_LE``, otherwise it supports any format
-specified in the :c:type:`struct snd_pcm_hardware
-<snd_pcm_hardware>` structure (or in any other
+specified in struct snd_pcm_hardware> (or in any other
 constraint_list). You can build a rule like this:
 
 ::
@@ -2467,7 +2461,7 @@ Definition of Controls
 
 To create a new control, you need to define the following three
 callbacks: ``info``, ``get`` and ``put``. Then, define a
-:c:type:`struct snd_kcontrol_new <snd_kcontrol_new>` record, such as:
+struct snd_kcontrol_new record, such as:
 
 ::
 
@@ -2602,8 +2596,8 @@ info callback
 ~~~~~~~~~~~~~
 
 The ``info`` callback is used to get detailed information on this
-control. This must store the values of the given :c:type:`struct
-snd_ctl_elem_info <snd_ctl_elem_info>` object. For example,
+control. This must store the values of the given
+struct snd_ctl_elem_info object. For example,
 for a boolean control with a single element:
 
 ::
@@ -2774,13 +2768,11 @@ In the simplest way, you can do like this:
   if (err < 0)
           return err;
 
-where ``my_control`` is the :c:type:`struct snd_kcontrol_new
-<snd_kcontrol_new>` object defined above, and chip is the object
-pointer to be passed to kcontrol->private_data which can be referred
-to in callbacks.
+where ``my_control`` is the struct snd_kcontrol_new object defined above,
+and chip is the object pointer to be passed to kcontrol->private_data which
+can be referred to in callbacks.
 
-:c:func:`snd_ctl_new1()` allocates a new :c:type:`struct
-snd_kcontrol <snd_kcontrol>` instance, and
+:c:func:`snd_ctl_new1()` allocates a new struct snd_kcontrol instance, and
 :c:func:`snd_ctl_add()` assigns the given control component to the
 card.
 
@@ -2797,10 +2789,9 @@ can call :c:func:`snd_ctl_notify()`. For example,
 This function takes the card pointer, the event-mask, and the control id
 pointer for the notification. The event-mask specifies the types of
 notification, for example, in the above example, the change of control
-values is notified. The id pointer is the pointer of :c:type:`struct
-snd_ctl_elem_id <snd_ctl_elem_id>` to be notified. You can
-find some examples in ``es1938.c`` or ``es1968.c`` for hardware volume
-interrupts.
+values is notified. The id pointer is the pointer of struct snd_ctl_elem_id
+to be notified. You can find some examples in ``es1938.c`` or ``es1968.c``
+for hardware volume interrupts.
 
 Metadata
 --------
@@ -2915,9 +2906,8 @@ with an ``ac97_bus_ops_t`` record with callback functions.
 
 The bus record is shared among all belonging ac97 instances.
 
-And then call :c:func:`snd_ac97_mixer()` with an :c:type:`struct
-snd_ac97_template <snd_ac97_template>` record together with
-the bus pointer created above.
+And then call :c:func:`snd_ac97_mixer()` with an struct snd_ac97_template
+record together with the bus pointer created above.
 
 ::
 
@@ -3118,11 +3108,10 @@ devices on the card, set ``MPU401_INFO_IRQ_HOOK`` (see
 
 Usually, the port address corresponds to the command port and port + 1
 corresponds to the data port. If not, you may change the ``cport``
-field of :c:type:`struct snd_mpu401 <snd_mpu401>` manually afterward.
-However, :c:type:`struct snd_mpu401 <snd_mpu401>` pointer is
+field of struct snd_mpu401 manually afterward.
+However, struct snd_mpu401 pointer is
 not returned explicitly by :c:func:`snd_mpu401_uart_new()`. You
-need to cast ``rmidi->private_data`` to :c:type:`struct snd_mpu401
-<snd_mpu401>` explicitly,
+need to cast ``rmidi->private_data`` to struct snd_mpu401 explicitly,
 
 ::
 
@@ -3772,7 +3761,7 @@ For creating the SG-buffer handler, call
 :c:func:`snd_pcm_set_managed_buffer_all()` with
 ``SNDRV_DMA_TYPE_DEV_SG`` in the PCM constructor like other PCI
 pre-allocator. You need to pass ``&pci->dev``, where pci is
-the :c:type:`struct pci_dev <pci_dev>` pointer of the chip as
+the struct pci_dev pointer of the chip as
 well.
 
 ::
-- 
2.26.2

