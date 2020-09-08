Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3502614E2
	for <lists+linux-doc@lfdr.de>; Tue,  8 Sep 2020 18:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731354AbgIHQkK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Sep 2020 12:40:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41648 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732043AbgIHQh1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Sep 2020 12:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599583043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tHKst8l8FPAJ/vK5VyCJy9S0TdMxqhIFxtiPwn30R+Y=;
        b=KWeMZ1y/Dh9nYi/wJNywIdQGMmYR+L+txyYC4Thyc7SS4ST9IDOA2RaCGsRwLCY3Io8C12
        1j1iC32ALMPf0g0Sa/htyF62iwEIyOqPvLz2/EPs5CAyS52q8WVLSt+2xQmmnPalJnVF6/
        R7rWS+FIo0q3UKKBvSbwPgCAsnRyu1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-UoNjtL1LNN61E1ENnwwkzw-1; Tue, 08 Sep 2020 12:37:18 -0400
X-MC-Unique: UoNjtL1LNN61E1ENnwwkzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0F481005504;
        Tue,  8 Sep 2020 16:37:14 +0000 (UTC)
Received: from gondolin (ovpn-112-243.ams2.redhat.com [10.36.112.243])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CEE8910013C4;
        Tue,  8 Sep 2020 16:37:04 +0000 (UTC)
Date:   Tue, 8 Sep 2020 18:37:01 +0200
From:   Cornelia Huck <cohuck@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
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
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-ntb@googlegroups.com,
        linux-pci@vger.kernel.org, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [RFC PATCH 00/22] Enhance VHOST to enable SoC-to-SoC
 communication
Message-ID: <20200908183701.60b93441.cohuck@redhat.com>
In-Reply-To: <9cd58cd1-0041-3d98-baf7-6e5bc2e7e317@redhat.com>
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
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 1 Sep 2020 16:50:03 +0800
Jason Wang <jasowang@redhat.com> wrote:

> On 2020/9/1 =E4=B8=8B=E5=8D=881:24, Kishon Vijay Abraham I wrote:
> > Hi,
> >
> > On 28/08/20 4:04 pm, Cornelia Huck wrote: =20
> >> On Thu, 9 Jul 2020 14:26:53 +0800
> >> Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> [Let me note right at the beginning that I first noted this while
> >> listening to Kishon's talk at LPC on Wednesday. I might be very
> >> confused about the background here, so let me apologize beforehand for
> >> any confusion I might spread.]
> >> =20
> >>> On 2020/7/8 =E4=B8=8B=E5=8D=889:13, Kishon Vijay Abraham I wrote: =20
> >>>> Hi Jason,
> >>>>
> >>>> On 7/8/2020 4:52 PM, Jason Wang wrote: =20
> >>>>> On 2020/7/7 =E4=B8=8B=E5=8D=8810:45, Kishon Vijay Abraham I wrote: =
=20
> >>>>>> Hi Jason,
> >>>>>>
> >>>>>> On 7/7/2020 3:17 PM, Jason Wang wrote: =20
> >>>>>>> On 2020/7/6 =E4=B8=8B=E5=8D=885:32, Kishon Vijay Abraham I wrote:=
 =20
> >>>>>>>> Hi Jason,
> >>>>>>>>
> >>>>>>>> On 7/3/2020 12:46 PM, Jason Wang wrote: =20
> >>>>>>>>> On 2020/7/2 =E4=B8=8B=E5=8D=889:35, Kishon Vijay Abraham I wrot=
e: =20
> >>>>>>>>>> Hi Jason,
> >>>>>>>>>>
> >>>>>>>>>> On 7/2/2020 3:40 PM, Jason Wang wrote: =20
> >>>>>>>>>>> On 2020/7/2 =E4=B8=8B=E5=8D=885:51, Michael S. Tsirkin wrote:=
 =20
> >>>>>>>>>>>> On Thu, Jul 02, 2020 at 01:51:21PM +0530, Kishon Vijay=20
> >>>>>>>>>>>> Abraham I wrote: =20
> >>>>>>>>>>>>> This series enhances Linux Vhost support to enable SoC-to-S=
oC
> >>>>>>>>>>>>> communication over MMIO. This series enables rpmsg=20
> >>>>>>>>>>>>> communication between
> >>>>>>>>>>>>> two SoCs using both PCIe RC<->EP and HOST1-NTB-HOST2
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> 1) Modify vhost to use standard Linux driver model
> >>>>>>>>>>>>> 2) Add support in vring to access virtqueue over MMIO
> >>>>>>>>>>>>> 3) Add vhost client driver for rpmsg
> >>>>>>>>>>>>> 4) Add PCIe RC driver (uses virtio) and PCIe EP driver=20
> >>>>>>>>>>>>> (uses vhost) for
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rpmsg communica=
tion between two SoCs connected to=20
> >>>>>>>>>>>>> each other
> >>>>>>>>>>>>> 5) Add NTB Virtio driver and NTB Vhost driver for rpmsg=20
> >>>>>>>>>>>>> communication
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 between two SoC=
s connected via NTB
> >>>>>>>>>>>>> 6) Add configfs to configure the components
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> UseCase1 :
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 VHOST RPMSG VIRTIO RPMSG
> >>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +
> >>>>>>>>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> +-----v------+ +------v-------+
> >>>>>>>>>>>>> |=C2=A0=C2=A0 Linux=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | Linux=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0 Endpoint=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Root Comp=
lex |
> >>>>>>>>>>>>> | <----------------->=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0=C2=A0=C2=A0 SOC1=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | SOC2=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> +------------+ +--------------+
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> UseCase 2:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VHO=
ST RPMSG VIRTIO RPMSG
> >>>>>>>>>>>>> + +
> >>>>>>>>>>>>> | |
> >>>>>>>>>>>>> | |
> >>>>>>>>>>>>> | |
> >>>>>>>>>>>>> | |
> >>>>>>>>>>>>> +------v------+ +------v------+
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | | |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 HOST1 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=20
> >>>>>>>>>>>>> HOST2=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | | |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> +------^------+ +------^------+
> >>>>>>>>>>>>> | |
> >>>>>>>>>>>>> | |
> >>>>>>>>>>>>> +----------------------------------------------------------=
-----------+=20
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> | +------v------+ +------v------+=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0 | | |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 EP |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | EP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> >>>>>>>>>>>>> |=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0 | CONTROLLER1 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=20
> >>>>>>>>>>>>> CONTROLLER2 |=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0 | <-----------------------------------> |=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0 | | |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0 | | |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 SoC With Multiple EP Instances=C2=A0=C2=A0=
=20
> >>>>>>>>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 |
> >>>>>>>>>>>>> |=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 (Configured using NTB Function)=C2=A0=20
> >>>>>>>>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 |
> >>>>>>>>>>>>> | +-------------+ +-------------+=C2=A0 |
> >>>>>>>>>>>>> +----------------------------------------------------------=
-----------+=20
> >>>>>>>>>>>>> =20
> >>
> >> First of all, to clarify the terminology:
> >> Is "vhost rpmsg" acting as what the virtio standard calls the 'device',
> >> and "virtio rpmsg" as the 'driver'? Or is the "vhost" part mostly just=
 =20
> >
> > Right, vhost_rpmsg is 'device' and virtio_rpmsg is 'driver'. =20
> >> virtqueues + the exiting vhost interfaces? =20
> >
> > It's implemented to provide the full 'device' functionality. =20

Ok.

> >> =20
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Software Layering:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> The high-level SW layering should look something like=20
> >>>>>>>>>>>>> below. This series
> >>>>>>>>>>>>> adds support only for RPMSG VHOST, however something=20
> >>>>>>>>>>>>> similar should be
> >>>>>>>>>>>>> done for net and scsi. With that any vhost device (PCI,=20
> >>>>>>>>>>>>> NTB, Platform
> >>>>>>>>>>>>> device, user) can use any of the vhost client driver.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +--------=
--------+ +-----------+=C2=A0 +------------+=20
> >>>>>>>>>>>>> +----------+
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 R=
PMSG VHOST=C2=A0=C2=A0 |=C2=A0 | NET VHOST |=C2=A0 | SCSI VHOST=20
> >>>>>>>>>>>>> |=C2=A0 |=C2=A0=C2=A0=C2=A0 X=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +-------^=
--------+ +-----^-----+=C2=A0 +-----^------+=20
> >>>>>>>>>>>>> +----^-----+
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> +-----------v-----------------v--------------v-------------=
-v----------+=20
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VHOST=20
> >>>>>>>>>>>>> CORE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> +--------^---------------^--------------------^------------=
------^-----+=20
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> +--------v-------+=C2=A0 +----v------+ +----------v--------=
--+=C2=A0=20
> >>>>>>>>>>>>> +----v-----+
> >>>>>>>>>>>>> |=C2=A0 PCI EPF VHOST |=C2=A0 | NTB VHOST | |PLATFORM DEVIC=
E VHOST|=C2=A0=20
> >>>>>>>>>>>>> |=C2=A0=C2=A0=C2=A0 X=C2=A0=C2=A0=C2=A0=C2=A0 |
> >>>>>>>>>>>>> +----------------+=C2=A0 +-----------+ +-------------------=
--+=C2=A0=20
> >>>>>>>>>>>>> +----------+ =20
> >>
> >> So, the upper half is basically various functionality types, e.g. a net
> >> device. What is the lower half, a hardware interface? Would it be
> >> equivalent to e.g. a normal PCI device? =20
> >
> > Right, the upper half should provide the functionality.
> > The bottom layer could be a HW interface (like PCIe device or NTB=20
> > device) or it could be a SW interface (for accessing virtio ring in=20
> > userspace) that could be used by Hypervisor.

Ok. In that respect, the SW interface is sufficiently device-like, I
guess.

> >
> > The top half should be transparent to what type of device is actually=20
> > using it.
> > =20
> >> =20
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> This was initially proposed here [1]
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> [1] ->
> >>>>>>>>>>>>> https://lore.kernel.org/r/2cf00ec4-1ed6-f66e-6897-006d1a5b6=
390@ti.com=20
> >>>>>>>>>>>>> =20
> >>>>>>>>>>>> I find this very interesting. A huge patchset so will take=20
> >>>>>>>>>>>> a bit
> >>>>>>>>>>>> to review, but I certainly plan to do that. Thanks! =20
> >>>>>>>>>>> Yes, it would be better if there's a git branch for us to=20
> >>>>>>>>>>> have a look. =20
> >>>>>>>>>> I've pushed the branch
> >>>>>>>>>> https://github.com/kishon/linux-wip.git vhost_rpmsg_pci_ntb_rf=
c =20
> >>>>>>>>> Thanks
> >>>>>>>>> =20
> >>>>>>>>>>> Btw, I'm not sure I get the big picture, but I vaguely feel=20
> >>>>>>>>>>> some of the
> >>>>>>>>>>> work is
> >>>>>>>>>>> duplicated with vDPA (e.g the epf transport or vhost bus). =20
> >>>>>>>>>> This is about connecting two different HW systems both=20
> >>>>>>>>>> running Linux and
> >>>>>>>>>> doesn't necessarily involve virtualization. =20
> >>>>>>>>> Right, this is something similar to VOP
> >>>>>>>>> (Documentation/misc-devices/mic/mic_overview.rst). The=20
> >>>>>>>>> different is the
> >>>>>>>>> hardware I guess and VOP use userspace application to=20
> >>>>>>>>> implement the device. =20
> >>>>>>>> I'd also like to point out, this series tries to have=20
> >>>>>>>> communication between
> >>>>>>>> two
> >>>>>>>> SoCs in vendor agnostic way. Since this series solves for 2=20
> >>>>>>>> usecases (PCIe
> >>>>>>>> RC<->EP and NTB), for the NTB case it directly plugs into NTB=20
> >>>>>>>> framework and
> >>>>>>>> any
> >>>>>>>> of the HW in NTB below should be able to use a virtio-vhost=20
> >>>>>>>> communication
> >>>>>>>>
> >>>>>>>> #ls drivers/ntb/hw/
> >>>>>>>> amd=C2=A0 epf=C2=A0 idt=C2=A0 intel=C2=A0 mscc
> >>>>>>>>
> >>>>>>>> And similarly for the PCIe RC<->EP communication, this adds a=20
> >>>>>>>> generic endpoint
> >>>>>>>> function driver and hence any SoC that supports configurable=20
> >>>>>>>> PCIe endpoint can
> >>>>>>>> use virtio-vhost communication
> >>>>>>>>
> >>>>>>>> # ls drivers/pci/controller/dwc/*ep*
> >>>>>>>> drivers/pci/controller/dwc/pcie-designware-ep.c
> >>>>>>>> drivers/pci/controller/dwc/pcie-uniphier-ep.c
> >>>>>>>> drivers/pci/controller/dwc/pci-layerscape-ep.c =20
> >>>>>>> Thanks for those backgrounds.
> >>>>>>> =20
> >>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0 So there is no guest or host as in
> >>>>>>>>>> virtualization but two entirely different systems connected=20
> >>>>>>>>>> via PCIe cable,
> >>>>>>>>>> one
> >>>>>>>>>> acting as guest and one as host. So one system will provide=20
> >>>>>>>>>> virtio
> >>>>>>>>>> functionality reserving memory for virtqueues and the other=20
> >>>>>>>>>> provides vhost
> >>>>>>>>>> functionality providing a way to access the virtqueues in=20
> >>>>>>>>>> virtio memory.
> >>>>>>>>>> One is
> >>>>>>>>>> source and the other is sink and there is no intermediate=20
> >>>>>>>>>> entity. (vhost was
> >>>>>>>>>> probably intermediate entity in virtualization?) =20
> >>>>>>>>> (Not a native English speaker) but "vhost" could introduce=20
> >>>>>>>>> some confusion for
> >>>>>>>>> me since it was use for implementing virtio backend for=20
> >>>>>>>>> userspace drivers. I
> >>>>>>>>> guess "vringh" could be better. =20
> >>>>>>>> Initially I had named this vringh but later decided to choose=20
> >>>>>>>> vhost instead of
> >>>>>>>> vringh. vhost is still a virtio backend (not necessarily=20
> >>>>>>>> userspace) though it
> >>>>>>>> now resides in an entirely different system. Whatever virtio is=
=20
> >>>>>>>> for a frontend
> >>>>>>>> system, vhost can be that for a backend system. vring can be=20
> >>>>>>>> for accessing
> >>>>>>>> virtqueue and can be used either in frontend or backend. =20
> >>
> >> I guess that clears up at least some of my questions from above...
> >> =20
> >>>>>>> Ok.
> >>>>>>> =20
> >>>>>>>>>>> Have you considered to implement these through vDPA? =20
> >>>>>>>>>> IIUC vDPA only provides an interface to userspace and an=20
> >>>>>>>>>> in-kernel rpmsg
> >>>>>>>>>> driver
> >>>>>>>>>> or vhost net driver is not provided.
> >>>>>>>>>>
> >>>>>>>>>> The HW connection looks something like=20
> >>>>>>>>>> https://pasteboard.co/JfMVVHC.jpg
> >>>>>>>>>> (usecase2 above), =20
> >>>>>>>>> I see.
> >>>>>>>>> =20
> >>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0 all the boards run Linux. The middle=
 board provides NTB
> >>>>>>>>>> functionality and board on either side provides virtio/vhost
> >>>>>>>>>> functionality and
> >>>>>>>>>> transfer data using rpmsg. =20
> >>
> >> This setup looks really interesting (sometimes, it's really hard to
> >> imagine this in the abstract.) =20
> >>>>>>>>> So I wonder whether it's worthwhile for a new bus. Can we use
> >>>>>>>>> the existed virtio-bus/drivers? It might work as, except for
> >>>>>>>>> the epf transport, we can introduce a epf "vhost" transport
> >>>>>>>>> driver. =20
> >>>>>>>> IMHO we'll need two buses one for frontend and other for
> >>>>>>>> backend because the two components can then co-operate/interact
> >>>>>>>> with each other to provide a functionality. Though both will
> >>>>>>>> seemingly provide similar callbacks, they are both provide
> >>>>>>>> symmetrical or complimentary funcitonality and need not be same
> >>>>>>>> or identical.
> >>>>>>>>
> >>>>>>>> Having the same bus can also create sequencing issues.
> >>>>>>>>
> >>>>>>>> If you look at virtio_dev_probe() of virtio_bus
> >>>>>>>>
> >>>>>>>> device_features =3D dev->config->get_features(dev);
> >>>>>>>>
> >>>>>>>> Now if we use same bus for both front-end and back-end, both
> >>>>>>>> will try to get_features when there has been no set_features.
> >>>>>>>> Ideally vhost device should be initialized first with the set
> >>>>>>>> of features it supports. Vhost and virtio should use "status"
> >>>>>>>> and "features" complimentarily and not identically. =20
> >>>>>>> Yes, but there's no need for doing status/features passthrough
> >>>>>>> in epf vhost drivers.b
> >>>>>>> =20
> >>>>>>>> virtio device (or frontend) cannot be initialized before vhost
> >>>>>>>> device (or backend) gets initialized with data such as
> >>>>>>>> features. Similarly vhost (backend)
> >>>>>>>> cannot access virqueues or buffers before virtio (frontend) sets
> >>>>>>>> VIRTIO_CONFIG_S_DRIVER_OK whereas that requirement is not there
> >>>>>>>> for virtio as the physical memory for virtqueues are created by
> >>>>>>>> virtio (frontend). =20
> >>>>>>> epf vhost drivers need to implement two devices: vhost(vringh)
> >>>>>>> device and virtio device (which is a mediated device). The
> >>>>>>> vhost(vringh) device is doing feature negotiation with the
> >>>>>>> virtio device via RC/EP or NTB. The virtio device is doing
> >>>>>>> feature negotiation with local virtio drivers. If there're
> >>>>>>> feature mismatch, epf vhost drivers and do mediation between
> >>>>>>> them. =20
> >>>>>> Here epf vhost should be initialized with a set of features for
> >>>>>> it to negotiate either as vhost device or virtio device no? Where
> >>>>>> should the initial feature set for epf vhost come from? =20
> >>>>>
> >>>>> I think it can work as:
> >>>>>
> >>>>> 1) Having an initial features (hard coded in the code) set X in
> >>>>> epf vhost 2) Using this X for both virtio device and vhost(vringh)
> >>>>> device 3) local virtio driver will negotiate with virtio device
> >>>>> with feature set Y 4) remote virtio driver will negotiate with
> >>>>> vringh device with feature set Z 5) mediate between feature Y and
> >>>>> feature Z since both Y and Z are a subset of X
> >>>>> =20
> >>>> okay. I'm also thinking if we could have configfs for configuring
> >>>> this. Anyways we could find different approaches of configuring
> >>>> this. =20
> >>>
> >>>
> >>> Yes, and I think some management API is needed even in the design of
> >>> your "Software Layering". In that figure, rpmsg vhost need some
> >>> pre-set or hard-coded features. =20
> >>
> >> When I saw the plumbers talk, my first idea was "this needs to be a new
> >> transport". You have some hard-coded or pre-configured features, and
> >> then features are negotiated via a transport-specific means in the
> >> usual way. There's basically an extra/extended layer for this (and
> >> status, and whatever). =20
> >
> > I think for PCIe root complex to PCIe endpoint communication it's=20
> > still "Virtio Over PCI Bus", though existing layout cannot be used in=20
> > this context (find virtio capability will fail for modern interface=20
> > and loading queue status immediately after writing queue number is not=
=20
> > possible for root complex to endpoint communication; setup_vq() in=20
> > virtio_pci_legacy.c). =20
>=20
>=20
> Then you need something that is functional equivalent to virtio PCI=20
> which is actually the concept of vDPA (e.g vDPA provides alternatives if=
=20
> the queue_sel is hard in the EP implementation).

It seems I really need to read up on vDPA more... do you have a pointer
for diving into this alternatives aspect?

>=20
>=20
> >
> > "Virtio Over NTB" should anyways be a new transport. =20
> >>
> >> Does that make any sense? =20
> >
> > yeah, in the approach I used the initial features are hard-coded in=20
> > vhost-rpmsg (inherent to the rpmsg) but when we have to use adapter=20
> > layer (vhost only for accessing virtio ring and use virtio drivers on=20
> > both front end and backend), based on the functionality (e.g, rpmsg),=20
> > the vhost should be configured with features (to be presented to the=20
> > virtio) and that's why additional layer or APIs will be required. =20
>=20
>=20
> A question here, if we go with vhost bus approach, does it mean the=20
> virtio device can only be implemented in EP's userspace?

Can we maybe implement an alternative bus as well that would allow us
to support different virtio device implementations (in addition to the
vhost bus + userspace combination)?

>=20
> Thanks
>=20
>=20
> >> =20
> >>>
> >>> =20
> >>>>>>>>> It will have virtqueues but only used for the communication
> >>>>>>>>> between itself and
> >>>>>>>>> uppter virtio driver. And it will have vringh queues which
> >>>>>>>>> will be probe by virtio epf transport drivers. And it needs to
> >>>>>>>>> do datacopy between virtqueue and
> >>>>>>>>> vringh queues.
> >>>>>>>>>
> >>>>>>>>> It works like:
> >>>>>>>>>
> >>>>>>>>> virtio drivers <- virtqueue/virtio-bus -> epf vhost drivers <-
> >>>>>>>>> vringh queue/epf>
> >>>>>>>>>
> >>>>>>>>> The advantages is that there's no need for writing new buses
> >>>>>>>>> and drivers. =20
> >>>>>>>> I think this will work however there is an addtional copy
> >>>>>>>> between vringh queue and virtqueue, =20
> >>>>>>> I think not? E.g in use case 1), if we stick to virtio bus, we
> >>>>>>> will have:
> >>>>>>>
> >>>>>>> virtio-rpmsg (EP) <- virtio ring(1) -> epf vhost driver (EP) <-
> >>>>>>> virtio ring(2) -> virtio pci (RC) <-> virtio rpmsg (RC) =20
> >>>>>> IIUC epf vhost driver (EP) will access virtio ring(2) using
> >>>>>> vringh? =20
> >>>>>
> >>>>> Yes.
> >>>>> =20
> >>>>>> And virtio
> >>>>>> ring(2) is created by virtio pci (RC). =20
> >>>>>
> >>>>> Yes.
> >>>>> =20
> >>>>>>> What epf vhost driver did is to read from virtio ring(1) about
> >>>>>>> the buffer len and addr and them DMA to Linux(RC)? =20
> >>>>>> okay, I made some optimization here where vhost-rpmsg using a
> >>>>>> helper writes a buffer from rpmsg's upper layer directly to
> >>>>>> remote Linux (RC) as against here were it has to be first written
> >>>>>> to virtio ring (1).
> >>>>>>
> >>>>>> Thinking how this would look for NTB
> >>>>>> virtio-rpmsg (HOST1) <- virtio ring(1) -> NTB(HOST1) <->
> >>>>>> NTB(HOST2)=C2=A0 <- virtio ring(2) -> virtio-rpmsg (HOST2)
> >>>>>>
> >>>>>> Here the NTB(HOST1) will access the virtio ring(2) using vringh? =
=20
> >>>>>
> >>>>> Yes, I think so it needs to use vring to access virtio ring (1) as
> >>>>> well. =20
> >>>> NTB(HOST1) and virtio ring(1) will be in the same system. So it
> >>>> doesn't have to use vring. virtio ring(1) is by the virtio device
> >>>> the NTB(HOST1) creates. =20
> >>>
> >>>
> >>> Right.
> >>>
> >>> =20
> >>>>>> Do you also think this will work seamlessly with virtio_net.c,
> >>>>>> virtio_blk.c? =20
> >>>>>
> >>>>> Yes. =20
> >>>> okay, I haven't looked at this but the backend of virtio_blk should
> >>>> access an actual storage device no? =20
> >>>
> >>>
> >>> Good point, for non-peer device like storage. There's probably no
> >>> need for it to be registered on the virtio bus and it might be better
> >>> to behave as you proposed. =20
> >>
> >> I might be missing something; but if you expose something as a block
> >> device, it should have something it can access with block reads/writes,
> >> shouldn't it? Of course, that can be a variety of things.
> >> =20
> >>>
> >>> Just to make sure I understand the design, how is VHOST SCSI expected
> >>> to work in your proposal, does it have a device for file as a backend?
> >>>
> >>> =20
> >>>>>> I'd like to get clarity on two things in the approach you
> >>>>>> suggested, one is features (since epf vhost should ideally be
> >>>>>> transparent to any virtio driver) =20
> >>>>>
> >>>>> We can have have an array of pre-defined features indexed by
> >>>>> virtio device id in the code.
> >>>>> =20
> >>>>>> and the other is how certain inputs to virtio device such as
> >>>>>> number of buffers be determined. =20
> >>>>>
> >>>>> We can start from hard coded the value like 256, or introduce some
> >>>>> API for user to change the value.
> >>>>> =20
> >>>>>> Thanks again for your suggestions! =20
> >>>>>
> >>>>> You're welcome.
> >>>>>
> >>>>> Note that I just want to check whether or not we can reuse the
> >>>>> virtio bus/driver. It's something similar to what you proposed in
> >>>>> Software Layering but we just replace "vhost core" with "virtio
> >>>>> bus" and move the vhost core below epf/ntb/platform transport. =20
> >>>> Got it. My initial design was based on my understanding of your
> >>>> comments [1]. =20
> >>>
> >>>
> >>> Yes, but that's just for a networking device. If we want something
> >>> more generic, it may require more thought (bus etc). =20
> >>
> >> I believe that we indeed need something bus-like to be able to support
> >> a variety of devices. =20
> >
> > I think we could still have adapter layers for different types of=20
> > devices ([1]) and use existing virtio bus for both front end and back=20
> > end. Using bus-like will however simplify adding support for new types=
=20
> > of devices and adding adapters for devices will be slightly more comple=
x.
> >
> > [1] -> Page 13 in=20
> > https://linuxplumbersconf.org/event/7/contributions/849/attachments/642=
/1175/Virtio_for_PCIe_RC_EP_NTB.pdf =20

So, I guess it's a trade-off: do we expect a variety of device types,
or more of a variety of devices needing different adapters?

