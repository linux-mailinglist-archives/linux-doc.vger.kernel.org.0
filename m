Return-Path: <linux-doc+bounces-41516-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B83A6BB80
	for <lists+linux-doc@lfdr.de>; Fri, 21 Mar 2025 14:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 763721895135
	for <lists+linux-doc@lfdr.de>; Fri, 21 Mar 2025 13:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0520B227EBD;
	Fri, 21 Mar 2025 13:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AVr7YmAw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F0A22ACF3
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742562795; cv=none; b=ImItVwr0ztMymJbWlB+pCJVse2lsQh8f+84gpHkarpf0KQjIQoE4BerbcamsCxX2QZzc3RKKDO3LwHsnAkLwOOW4ZKf2+lG4q/XpqlMcfIRliCOSI6RBGpD9P2fS3gmYQSZKKOecchDplc06KCYI7B4Sk2QjGwSnkzmU07Oj5L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742562795; c=relaxed/simple;
	bh=gBMuiDhCemk5cSPTk5dmy01AjipaPQhh1hQfbQoK9+w=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=BXliI+F/0OEmlGOOIsm+6E5eLP2kPQcOmoB6RaE26CJ5sQSWGiG0+HsJH6VaVfXLF6P9kjF7lgxyYsiRjKsvGyVB80Ww9P+CbWKEtvF1+wqXhBiFUuOkaT0V7/QBdnTpJP2FuvEVjSyCs6XuN5U9SBcAx0VnJPrblBeW+skxW80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AVr7YmAw; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so3040627a12.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 06:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742562792; x=1743167592; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azxH+KYm8tJkLH7rFHwCJLBDMbyPBsLOxN72/qPc1Xk=;
        b=AVr7YmAw/ej31E45hIjLMKkNTCngcDZ6dcaInOv0CrseUD1VZgNWJVAolqi9newOIH
         XUC7+F2hIyFEgnYhBDCEJKAjs4RQrq6E6Ah5z1ZsD9c3DZJah/SFTAaooMvz2hfXoqXu
         buwDyX6Pi3CEZYJLhwDF8K7buus17ZaxoNvyQBsmnhjZb60B3p/epXkH97O31VT1eSp/
         qr3R+PLDvTp5Sg7aereNlDPltuYKN6Bux0ilzQbS7qmG9ssT7jM0pPP4Ac5S6Kp0NJPd
         GvsG1ylRS9oaDng2iGg+cWzIxErGtQ2Vb5jKrJ/E3vprpS3psmJQhwKC/JFdtKgsf2p8
         yBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562792; x=1743167592;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=azxH+KYm8tJkLH7rFHwCJLBDMbyPBsLOxN72/qPc1Xk=;
        b=wXDf85b5yjDYgNxc5JcWbZZvxkR0Al9kjN1jSKJnO8MsLCjbEn7JTeAFCV9gzLOE3t
         Cz57uiu33zjh5yTEft/pMPLSmnngvE9Xl/2CCxq+ihxU3CqA/If9E8RdhsR1nx4CxHPz
         mpcBlevgybBVufgIgXH42nEAtVdUBCkFxuX1DRrlunrMyEe8AmqXWUEBPkhe4KOrQ6lq
         tpOcQjgnWYeBzCsX5uuU5rYv5GnrGTrhbe+m8VXYUvcGGbefDo+WWrcU4zvUiyJfdwo1
         vXhdQWCySt/iKZrAtYeUZM0jNDto/XKKE9IkwRfGOqKXtTkASblpi6snhckriPVkDRim
         aTmg==
X-Forwarded-Encrypted: i=1; AJvYcCUi5Bn7WXMMUhHGNR17S5EC9CxNIAutuHFUmcxjx5IBKq5L55lkZXadPBo6l8A6InH8DLW4gCbcO3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDIWMj4FpHnouxTuNk2N3eF1qFJdJlxl5fBFrV45IZDcKZS6Hu
	uq96w36Csu/s32Yk3GstVhNvMzWnmtOwZdqf+107Q70CDljYaSDaajig9pmzh9A=
X-Gm-Gg: ASbGncsANThqDi6GETIZ1yh4IKKAmdnIioq9gbnf0doSLZSUQYnQdfu5P8HTWV86q/H
	7tSPErOOyew0cFtO2pXmpWkZG6QOw6rK1v6rzl5u9xGos3kXuHScmTodvs/9ubYQTXm+Rg70x6E
	nTNbFtX1+/OlUcngOuIpGvYTMS9GZkF3nlDdjom8JE8uT01adtAqCKUr/ZgRopdtF8TSVwjdCvK
	XtbB2hsUQo8T9NwPjcAA84rsPPJIdEw5l8M5mrBN6nn8oTN7vNvj4LeaSfDW9juX/QvDD78S2lE
	7F42KIwrtJM6X/Paz1AoJhtiyBjM/cSTRvrNjGnpzcbJ22csp3avcoTAktdhdDF6tvWKIK70Uct
	pA28jKC5XSghBNQ==
X-Google-Smtp-Source: AGHT+IE8PhCgUGBY/JkCA/TsunqWtiCtyLdiJOJyXQ4SyEMmQjgGArax5BsxRlrz/Py8KVlD3G8r/g==
X-Received: by 2002:a05:6402:1d4a:b0:5e8:bf8b:4396 with SMTP id 4fb4d7f45d1cf-5ebcd42dd1fmr3003367a12.13.1742562791878;
        Fri, 21 Mar 2025 06:13:11 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0c7157sm1344509a12.60.2025.03.21.06.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 06:13:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Mar 2025 14:13:10 +0100
Message-Id: <D8LYYEQJ2W4L.1H7FPF4140BVS@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Wesley Cheng" <quic_wcheng@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
 <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
 <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
 <gregkh@linuxfoundation.org>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v36 00/31] Introduce QC USB SND audio offloading support
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-1-quic_wcheng@quicinc.com>

Hi Wesley,

On Wed Mar 19, 2025 at 1:51 AM CET, Wesley Cheng wrote:
> Requesting to see if we can get some Acked-By tags, and merge on usb-next=
.
>
> Several Qualcomm based chipsets can support USB audio offloading to a
> dedicated audio DSP, which can take over issuing transfers to the USB
> host controller.  The intention is to reduce the load on the main
> processors in the SoC, and allow them to be placed into lower power modes=
.
> There are several parts to this design:
>   1. Adding ASoC binding layer
>   2. Create a USB backend for Q6DSP
>   3. Introduce XHCI interrupter support
>   4. Create vendor ops for the USB SND driver
>

I was able to test this series (v35) on SM6350/SM7225 Fairphone 4
smartphone and it appears to work as expected!

Based on the sm8350 branch you shared[0] I added similar dts bits for my
device, I've pushed that branch here[1] for reference.

[0] https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/commits/usb_a=
udio_offload/
[1] https://github.com/sm6350-mainline/linux/commits/sm6350-6.14-wip-usb-sn=
d-offload/

And I've used these commands to test:

fairphone-4:~$ amixer -c0 cset name=3D'USB Mixer MultiMedia2' On

fairphone-4:~$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: F4 [Fairphone 4], device 0: MultiMedia1 (*) []
Subdevices: 1/1
Subdevice #0: subdevice #0
card 0: F4 [Fairphone 4], device 1: MultiMedia2 (*) []
Subdevices: 1/1
Subdevice #0: subdevice #0
card 1: Audio [Hi-Res Audio], device 0: USB Audio [USB Audio]
Subdevices: 1/1
Subdevice #0: subdevice #0

fairphone-4:~$ ffmpeg -i test.m4a -acodec pcm_s16le test.wav

fairphone-4:~$ aplay --device=3Dplughw:0,1 Music/test.wav
Playing WAVE 'Music/test.wav' : Signed 16 bit Little Endian, Rate 44100 Hz,=
 Stereo

And then music was coming out of these headphones connected via a USB-C
to 3.5mm dongle.

Every time I'm starting playback this error appears in dmesg, do you
also see this on your test setup?

[ 1336.081525] q6afe-dai 3000000.remoteproc:glink-edge:apr:service@4:dais: =
AFE Port already open


And if I'm not mistaken it's possible to check that actually the offload
path is getting used by checking the interrupt counts of the xhci-hcd
interrupt.

With regular USB audio card playback there's many interrupts per second
happening:

fairphone-4:~$ aplay --device=3Dplughw:1,0 Music/test.wav # regular USB
fairphone-4:~$ cat /proc/interrupts | grep -i usb
188:     137524          0          0          0          0          0     =
     0          0    GICv3 165 Level     xhci-hcd:usb1
fairphone-4:~$ cat /proc/interrupts | grep -i usb
188:     137591          0          0          0          0          0     =
     0          0    GICv3 165 Level     xhci-hcd:usb1

And with the offload card during playback there's no interrupts
happening (just a few when initially starting playback):

fairphone-4:~$ aplay --device=3Dplughw:0,1 Music/test.wav # offload
fairphone-4:~$ cat /proc/interrupts | grep -i usb
188:     141947          0          0          0          0          0     =
     0          0    GICv3 165 Level     xhci-hcd:usb1
fairphone-4:~$ cat /proc/interrupts | grep -i usb
188:     141947          0          0          0          0          0     =
     0          0    GICv3 165 Level     xhci-hcd:usb1


Let me know what you think about the message in dmesg I mentioned above.

Regards
Luca

