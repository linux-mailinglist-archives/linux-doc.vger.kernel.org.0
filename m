Return-Path: <linux-doc+bounces-41464-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B90A6ACAD
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 19:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7C3B8A6676
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 18:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4CB1E1C02;
	Thu, 20 Mar 2025 18:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="RArY62rl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFEC1BD9FA
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 18:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742493830; cv=none; b=oxd89HvdJkWEwh3mN6OKT8ChXDMso8SX4vGc79ijqjf8kW1CYw8oPptiPEIoE2U2NLngPU5qlL3X7j6lZXoQU7HZrmGzSqCeVaNwE3rpYqd87EW0sDpMlJm3pz0XFVKOn/5X2wI2hTYebIKfUqvYnw8f0XWggl+nBbdCxHLJ/DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742493830; c=relaxed/simple;
	bh=xY9jTF3mF9q2tHWOqWwgarBOfsep4yNt1Wf6UXZSQE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufAzUgDNDm07kENwZcoe1cuvkBvnHnizfVst7fHZOha8osihrU/1Ap6hO9plljKI3JPLGk5JiTp0Ju3HG2egpH3jJLWZQ1vh2hamot+ou8Ka1N1fbmOoKRWhuQApsxWttnBW17XiIvcanjUL81UqEqyTrN0oJRH5U11tD8yPX7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=RArY62rl; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476a304a8edso10258711cf.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 11:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1742493827; x=1743098627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEWRrYL81JihAJazUhZRKND0YCO46+skLrt/0zhqckA=;
        b=RArY62rlYHgRZQBdlxiv3gu11Zo2DMqT6/Fxz2oKpa2ktDUyA/o1T4mz5eUl2hkdkb
         0HjtDx2r/MMGZgx9LjWEU+yFD/bWNcZfMsl3VthP3WL9fn8/GuKpJZrN+6pq9FiT7ibl
         afnRpRH59mONBFqpcX3FlxEaWVup0Xsu6UNrakhzwgSuBxXbYAm41/EKMMf4b1ak1O6C
         DKs6z3bA8CjATdMST5I+GhDdagLPVPgIo177vB8JQXEMD+kVykKJ/0GnsXmU9FM4wxd4
         /SOW0He0G3p1JghzjlaNohwaHWa0dF+46QZJLHh5F3q7jkzT2NQ1h7HEa1eKAV9nXSAj
         Unhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742493827; x=1743098627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEWRrYL81JihAJazUhZRKND0YCO46+skLrt/0zhqckA=;
        b=T/X0yfPf1sIHSXiUuhZEtF118fX2+ssFAe9jxELep4EUXbYEtTIM7W9esbn0MsK+c8
         IiClIC8pI7B8ZHqtsuvMCf4NQBBXKQ1NGeUDQ0SFJRA1NuHsBC1gkmg4Sx0W7vWXjz/W
         eGdtkqkOHKgZ7+Maokw31NagvVkR0Drf/HUg/NhmTiv7VW/SLrslhLXzNf+U4AJybPxd
         A8sMQ4Cwh/zPpYy+aqG7miQrfJA8eaBQ72CY8cNTrcNxocNSZKEakOv9npwC2nF+ir2E
         M8YdFGkld5ywkb2xshwW35DV8iZOB4qufLwCvzZ19mSz6p1kRH5/CQrASo8s9JX9ycYz
         KXSg==
X-Forwarded-Encrypted: i=1; AJvYcCVTvdrmL1JamF2Vv/PhkX3ft92yf9lf3dPqI0rTD/krUegTVF0xSvZGsL1aDz9l581y1h9+9Kh/o7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuofXsYMCfj/ly1rj+ErDET2XipPPDiUkd7nmRaP0COVpVJO+M
	L/LWEMaJog1fqvRKsPNwYS2vmyzBhHz4qpVbauE0r/q7v4PNBUCXywV7ILy8inEMVtJavmVbgGL
	sTtfOJPaSi6pj7jvYK5laWn769p9AqPQKdpdaXw==
X-Gm-Gg: ASbGncv7UQCF3e30yYNVz51sT2xYzwsRCybmUvCqgU/wHMWE96ppUuHqxAnksjhXrAm
	kgvileJVI4E3JG0AtDoVlMn6NKa+oq5qkVYubCr29lVVF0e5wFu1jdQyPIz+MZ7WNUllpeRideC
	XtiinKas7/8f26Za14rdJssss=
X-Google-Smtp-Source: AGHT+IGY2UOOzyotLrqjin40PYelcsYa/VhmCLulBzUFzsbC3V6wg+CyJm8VRhjJJFkAkC9pww3riPd+ntiYsa9NfTA=
X-Received: by 2002:a05:622a:5c8b:b0:474:e255:db2c with SMTP id
 d75a77b69052e-4771dd8dd21mr3600651cf.26.1742493827149; Thu, 20 Mar 2025
 11:03:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320024011.2995837-1-pasha.tatashin@soleen.com>
 <20250320024011.2995837-3-pasha.tatashin@soleen.com> <2025032058-reassure-veneering-0fdb@gregkh>
In-Reply-To: <2025032058-reassure-veneering-0fdb@gregkh>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 20 Mar 2025 14:03:10 -0400
X-Gm-Features: AQ5f1JqUt7jlSeOStqUEKgBoUzbkc-shkgv5lvEs9-PxXsZsyZ9P_iNSvHCE62k
Message-ID: <CA+CK2bA8vLjODhM1puia-SOnk9kiFhd7WXHVemh+YBuN4kSgwQ@mail.gmail.com>
Subject: Re: [RFC v1 2/3] luo: dev_liveupdate: Add device live update infrastructure
To: Greg KH <gregkh@linuxfoundation.org>
Cc: changyuanl@google.com, graf@amazon.com, rppt@kernel.org, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, jgowans@amazon.com, jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 9:36=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Mar 20, 2025 at 02:40:10AM +0000, Pasha Tatashin wrote:
> > Introduce a new subsystem within the driver core to enable keeping
> > devices alive during kernel live update. This infrastructure is
> > designed to be registered with and driven by a separate Live Update
> > Orchestrator, allowing the LUO's state machine to manage the save and
> > restore process of device state during a kernel transition.
> >
> > The goal is to allow drivers and buses to participate in a coordinated
> > save and restore process orchestrated by a live update mechanism. By
> > saving device state before the kernel switch and restoring it
> > immediately after, the device can appear to remain continuously
> > operational from the perspective of the system and userspace.
> >
> > components introduced:
> >
> > - `struct dev_liveupdate`: Embedded in `struct device` to track the
> >   device's participation and state during a live update, including
> >   request status, preservation status, and dependency depth.
> >
> > - `liveupdate()` callback: Added to `struct bus_type` and
> >   `struct device_driver`. This callback receives an enum
> >   `liveupdate_event` to manage device state at different stages of the
> >   live update process:
> >     - LIVEUPDATE_PREPARE: Save device state before the kernel switch.
> >     - LIVEUPDATE_REBOOT: Final actions just before the kernel jump.
> >     - LIVEUPDATE_FINISH: Clean-up after live update.
> >     - LIVEUPDATE_CANCEL: Clean up any saved state if the update is
> >       aborted.
> >
> > - Sysfs attribute "liveupdate/requested": Added under each device
> >   directory, allowing user to request that a specific device to
> >   participate in live update. I.e. its state is to be preserved
> >   during the update.
>
> As you can imagine, I have "thoughts" about all of this being added to
> the driver core.  But, before I go off on that, I want to see some real,
> actual, working, patches for at least 3 bus subsystems that correctly
> implement this before I even consider reviewing this.
>
> Show us real users please, otherwise any attempt at reviewing this is
> going to just be a waste of our time as I have doubts that this actually
> even works :)
>
> Also, as you are adding a new user/kernel api, please also point at the
> userspace tools that are written to handle all of this.  As you are
> going to be handling potentially tens of thousands of devices from
> userspace this way, in a single system, real code is needed to even
> consider that this is an acceptable solution.

Hi Greg,

Thanks for the feedback on this RFC. I understand your hesitation
about adding this to the driver core without seeing concrete
implementations. The primary goal of posting this RFC now is to get
early feedback on the overall state machine and rules concept. We have
a bi-weekly meeting [1] where the "Live Update Orchestrator" is
scheduled for presentation. I wanted to give people a chance to look
at the framework ahead of those discussions.

Regarding your request for real, working patches, we are actively
working on that. Our current efforts are focused on adding live update
support for LUO for these subsystems: KVM, Interrupts, IOMMU, Devices

Within the devices subsystem, we are targeting generic PCI, VFIO, and
a few other device types (real and emulated) to demonstrate the
implementation.

I absolutely agree that demonstrating a real use case is important.
However, this is a complicated project that involves changes in many
parts of the kernel, and we can't deliver everything in one large
patchset; it has to be divided and addressed incrementally.

So far, we have the following pieces of the Live Update puzzle: KHO
(for preserving kernel memory), LUO (for driving the live update
process), and Dev_Liveupdate (for managing device participation in
live update), IOMMU preservation [2], guest memory [3], and we are
planning to add support for interrupts, PCIe, VFIO, some drivers, and
other components.

On the user side, we are planning to propose the necessary changes to
VMMs such as CloudHypervisor and QEMU.

Thanks,
Pasha

[1] https://lore.kernel.org/all/a350f3e5-e764-4ba6-f871-da7252f314da@google=
.com
[2] https://lpc.events/event/18/contributions/1686
[3] https://lore.kernel.org/all/20240805093245.889357-1-jgowans@amazon.com

