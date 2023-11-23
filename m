Return-Path: <linux-doc+bounces-2972-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE8F7F5AD4
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 10:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA3461F20EC6
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 09:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8D41DFC3;
	Thu, 23 Nov 2023 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="U2QzPYso";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="/G3NJ9Vm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F941A4;
	Thu, 23 Nov 2023 01:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700730295; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LHp2cbonTmPWq3yzdJRpVSb2c5jnbOAAOh/OJOzzmcQgLMPoucR/L1eLLDbWeVuinc
    rQM5QMhkpKO0WuQI4pg/FWbEDszKpMpEky4Xg7i153ixuo86wUKDvORow2d5k17QNloV
    SiY885/O0UhwPHBkDBtaCmH+16vFOdSpPDClnK/apD3etF9Eqw9lJPJmdn2H5ZXPVu8C
    8Zt4xTCCom+++G3P/ZnFLZUol+igO1S1RDu4pxUgrYVnVMTBHOebG+xrUH5QU2w4GMy3
    8c26wBo6mHoIBydZMy2OJfF4avAkG8RVQq8jlNj+gZ9eeovaWa0Te0HxfkxT6BeTiucV
    l4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1700730295;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=nNzQepdNAiibjyoRsdDNPpF5A3KPnlNrpzPamrJ6O6k=;
    b=o+sw8qeV76ZfPK8zRhqa70h/4k6+zRAxh4kYuRiIIzgxdn2axVpTbgV6p63pQ7XR7+
    YLE8JnDzTDBnFgLBlmQP8jjMeER7MofmD9qxm2hk82Mxy3pinVLQaoJNxxpC+FzZfB9b
    rJiwRuR9Y0h04i7jC+bzrMmIiXVYZNd47ObSRWqzwqVvNJxkHliGM/KKTQDurrE7Ej13
    PDAjqsl4md6j9OhQeUV3GZWmIXxAXnSBgwXXPF9IddBoaRLBfMaCl1FtMIajPq3y7o6b
    /UESB8QHcXqC2HYU61y9U9qJv8uc4SjCH+GFDL7CAZvOCkkUn1zswwUlCiMKsQpgB2KT
    XfTw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1700730295;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=nNzQepdNAiibjyoRsdDNPpF5A3KPnlNrpzPamrJ6O6k=;
    b=U2QzPYsoe/zMuR/GuenD3GD091175MxH8cbVbY+G9U75mtTl9ZzO58KCnHSP9PQDoa
    LRvEOyvicJfImOGBwupknGcOf38NXj6nisyUyrtYWv0WW6GCbHk7r8EWFsGPYmz4Gb+/
    80QqNvJFPT718oOA3JUmWQY6ASWDG6Sb+pXDozZeyRRL9Ne4evpk6XaTkG3y1AdtfkmV
    und6fVTTIDit0NCJbhsfd3Kq+yuGC49DetYHfJZOE3ynXe12TaVCzDSOdrXq3jkGg6+Z
    lQ1PVuWu1TyfbKpUunt8GSxlkVCSv9pxT6TQ02Wn3n8uIgh4DPdcW6perX3rvJO9QKVk
    kDDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1700730295;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=nNzQepdNAiibjyoRsdDNPpF5A3KPnlNrpzPamrJ6O6k=;
    b=/G3NJ9VmY5w1Zao2l6XzOxP7VH1FP5BT0nviqU8UU7sR5ZBbpwmgz7yM7+/AbtSmuI
    bTtEqAAwBwanCgoc1kDQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qviAxtjc3+nQmK9mGUJvNRIFjU/rZXA1cPerj45fcwi7w=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.9.1 AUTH)
    with ESMTPSA id 42749ezAN94rARP
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 23 Nov 2023 10:04:53 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH v9 00/20] Imagination Technologies PowerVR DRM driver
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <jl4igixnszibpq5hindyjvrh6eten7mjr6hj32fst4irjbg2t6@gdks4ydvhshw>
Date: Thu, 23 Nov 2023 10:04:42 +0100
Cc: boris.brezillon@collabora.com,
 faith.ekstrand@collabora.com,
 airlied@gmail.com,
 daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de,
 afd@ti.com,
 matthew.brost@intel.com,
 christian.koenig@amd.com,
 luben.tuikov@amd.com,
 dakr@redhat.com,
 linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 corbet@lwn.net,
 linux-doc@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org,
 openpvrsgx-devgroup@letux.org,
 kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <F774B5D6-BC66-414A-B3E2-DED68FB59644@goldelico.com>
References: <cover.1700668843.git.donald.robson@imgtec.com>
 <jl4igixnszibpq5hindyjvrh6eten7mjr6hj32fst4irjbg2t6@gdks4ydvhshw>
To: frank.binns@imgtec.com,
 matt.coster@imgtec.com,
 Donald Robson <donald.robson@imgtec.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)



> Am 22.11.2023 um 20:34 schrieb Maxime Ripard <mripard@kernel.org>:
>=20
> Hi,
>=20
> On Wed, Nov 22, 2023 at 04:34:21PM +0000, Donald Robson wrote:
>> This patch series adds the initial DRM driver for Imagination =
Technologies PowerVR
>> GPUs, starting with those based on our Rogue architecture. It's worth =
pointing
>> out that this is a new driver, written from the ground up, rather =
than a
>> refactored version of our existing downstream driver (pvrsrvkm).
>>=20
>> This new DRM driver supports:
>> - GEM shmem allocations
>> - dma-buf / PRIME
>> - Per-context userspace managed virtual address space
>> - DRM sync objects (binary and timeline)
>> - Power management suspend / resume
>> - GPU job submission (geometry, fragment, compute, transfer)
>> - META firmware processor
>> - MIPS firmware processor
>> - GPU hang detection and recovery
>>=20
>> Currently our main focus is on the AXE-1-16M GPU. Testing so far has =
been done
>> using a TI SK-AM62 board (AXE-1-16M GPU). The driver has also been =
confirmed to
>> work on the BeaglePlay board. Firmware for the AXE-1-16M can be found =
here:
>> =
https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/powervr
>>=20
>> A Vulkan driver that works with our downstream kernel driver has =
already been
>> merged into Mesa [1][2]. Support for this new DRM driver is being =
maintained in
>> a merge request [3], with the branch located here:
>> https://gitlab.freedesktop.org/frankbinns/mesa/-/tree/powervr-winsys
>>=20
>> Vulkan driver links referred to above:
>> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
>> [2] =
https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/vulka=
n
>> [3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15507
>>=20
>> Job stream formats are documented at:
>> =
https://gitlab.freedesktop.org/mesa/mesa/-/blob/f8d2b42ae65c2f16f36a43e0ae=
39d288431e4263/src/imagination/csbgen/rogue_kmd_stream.xml
>>=20
>> The Vulkan driver is progressing towards Vulkan 1.0. The current =
combination of this
>> kernel driver with the Mesa Vulkan driver (powervr-mesa-next branch) =
successfully
>> completes Vulkan CTS 1.3.4.1 in our local runs. The driver is =
expected to pass the
>> Khronos Conformance Process once the submission is made.
>>=20
>> The code in this patch series, along with the needed dts changes can =
be found here:
>> https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/dev/v9_dts
>> The full development history can be found here:
>> https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/powervr-next
>=20
> I just merged all the patches to drm-misc-next.
>=20
> Congrats :)

A big applause to the team that accomplished this!

Let me take this opportunity to ask if there could be a similar effort =
supported by imgtec
for the SGX drivers? There are still a lot of devices using this version =
of PVR in the wild,
like OpenPandora or Pyra Handheld, that are stuck with older Linux =
kernels (which are now
unmaintained) because there are no compatible SGX drivers for modern =
kernels.

And we have the openpvrsgx community that can definitely help with =
debugging (we all own
various OMAP and jz4780 devices), but we lack the documentation to =
actually develop and
upstream such a driver (and user-space code) ourselves.

Nikolaus


