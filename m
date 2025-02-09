Return-Path: <linux-doc+bounces-37444-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F4DA2D9F5
	for <lists+linux-doc@lfdr.de>; Sun,  9 Feb 2025 01:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78B567A2FC7
	for <lists+linux-doc@lfdr.de>; Sun,  9 Feb 2025 00:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE72E20EB;
	Sun,  9 Feb 2025 00:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="Xgb7XH/7"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58861392
	for <linux-doc@vger.kernel.org>; Sun,  9 Feb 2025 00:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739060645; cv=none; b=Ey4+olg+VVsbfSoaTC6LnZurzihOTP2QQk9X3CUMcksDscu9WPxq9HvIxf+N4/X02E1ypbLXN8l8hqYKsJGHOZd6bBx4ha9azxgt8pezpUpMFoSFJpFLcRCQYzNF3530V/MPVqnA/Za/29WywYsOT0zdvf6WPu5cuSyd8L35Uoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739060645; c=relaxed/simple;
	bh=8rgYzZv3rSSdAvQylMlRpXn+zz10aBE5mdUoPt384Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tF0TmU9OSZIWtHL/Rpl0fdeS5nQ/fm6FbplGtTMTxrvjhlnCNGNMRKoPUOR2VhmzeDA8GJgDJS5Hct+jcvwLKoVneXOpGsKJqyAIULmAv9IbMnDUX4h7pNrNH+HKsWVXyheTFIEzJIAMKSV2hnPd8ziakn/Yy1ba9be/f8EAB4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=Xgb7XH/7; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467918c360aso41460151cf.0
        for <linux-doc@vger.kernel.org>; Sat, 08 Feb 2025 16:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1739060643; x=1739665443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gjXaQBLaw4NUMDsntEFs7TEopqGWrY+9/yjxC8/Zts=;
        b=Xgb7XH/7tYqM+PvmRQHe0Fpuxjvt115x9N0pjfi4kdZVhGng4SDnD7m4Y8lhWGUI4Y
         duWWozNFbruqsRMVmGf71NDi3YQNB88KeYjxBXr6HETwlE1A195xVd9tMMNxK0ReC94z
         dQJnXrXXuvSFjToyKdzcOP0AXFMZbq7FxghqowR0a5+rvRfUsVosqCndmvOvoDZAz81C
         PyNcQcG41zzMdiVFAkb2mgLTnbgYABWYK7vvWfCFdsuFA66b/R/102Z7jPkgZ39DGIwN
         9F0ffcLugeF6c9nP7lDfvggRbXb8ZRmoWDZSjisGBuY0yi2KN11kHv77BUYwJ16+tdro
         uqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739060643; x=1739665443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gjXaQBLaw4NUMDsntEFs7TEopqGWrY+9/yjxC8/Zts=;
        b=KlRk4Eu1ZoM6CIbTSvhvsX+lzIaVeAFgoBpksYOp1TPDaIxhOXWlTYjCL+/Oag3mmb
         CH+aB4AkgefkfhktZ7Tjcizha5A25x3xYorI+ktlpglLvMoQPTNaagBitig/q/GsMQpe
         D94AV7OygglKvC5bfI/7qrZb2vubjzsVZq6BztdHF0h6NfDbgxYxtSI2ombGL6fTavAA
         uZiKbyhMvQCmmN2SprjXY6BHMPBm3rMUf05CiDlcWea0Cg3+IoX/8lPYehGUpKfRgZtL
         oMftoiA04zwM2FhlJhLAz7xrMdSdTUkg492rv/x58zfwx617hj8/cipxe5DFIXWgycSd
         Alpg==
X-Forwarded-Encrypted: i=1; AJvYcCXk90mtvWwqOhwW1+sPM703M0lYvUKwTOgOmWuvVaOQYKo2rDWvWnvmocu5eN5HHDmuaLqr8j/v8N8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ5vcSGQfgbm+P0tVZ2hi3q7823ZMuPGr2BW4ZNT3x1B/OYItM
	0t08rx5dvnBLqiPdlu3hANU4ZXdGXEWones5oW43Acr7ZJJxE7MoQe55nbzqrQi+Luln661iz4a
	BhZ/JKY5t8KNDzCKEsZWLeY0KuLzfkM8PJHcYDQ==
X-Gm-Gg: ASbGnct9RZlE30Q8rf7GyFjdtfNeFw4ytAW5HmZzfz0P3MwpYna96ZIsskyy7hXS3hx
	eOoGXAj+KnDfrZcbEVdLn2nVYCtGsZxuEZdYzWKeNSHTwRZw3sgBQJ6B8TYAv1Ir7sZWmCw==
X-Google-Smtp-Source: AGHT+IEWLXbbE35/NH7CqFs9Aene/KOrNSHj6kBiOSxP6T7AhYHyVwGrjMz5VAE9dQe0u6W8V5wpkpW0r78/dGV9jWk=
X-Received: by 2002:a05:622a:1195:b0:460:8e3b:6790 with SMTP id
 d75a77b69052e-47167c10096mr111860501cf.48.1739060642643; Sat, 08 Feb 2025
 16:24:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <20250206162939.a1f86fb835f1eeb7ed73ff1c@linux-foundation.org>
 <CA+CK2bD6204AKWGOgzLMiMsnVZ=tk+DGc+VWgi3RVt2byaLJJA@mail.gmail.com> <Z6a1kxR2GlQoepgI@MiWiFi-R3L-srv>
In-Reply-To: <Z6a1kxR2GlQoepgI@MiWiFi-R3L-srv>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 8 Feb 2025 19:23:25 -0500
X-Gm-Features: AWEUYZm4sw7r0YqYCsAlTqJTyIoFI_gwgSC8Xqrde5SyZs_ybRNGci9xB-WlypE
Message-ID: <CA+CK2bDgP2DfsfVAhQhFhBiNJFUS1n17oX9KgC1JFXAk76j01Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
To: Baoquan He <bhe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>, 
	Andy Lutomirski <luto@kernel.org>, Anthony Yznaga <anthony.yznaga@oracle.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Woodhouse <dwmw2@infradead.org>, Eric Biederman <ebiederm@xmission.com>, 
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org, 
	changyuanl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 8:38=E2=80=AFPM Baoquan He <bhe@redhat.com> wrote:
>
> On 02/06/25 at 08:28pm, Pasha Tatashin wrote:
> > On Thu, Feb 6, 2025 at 7:29=E2=80=AFPM Andrew Morton <akpm@linux-founda=
tion.org> wrote:
> > >
> > > On Thu,  6 Feb 2025 15:27:40 +0200 Mike Rapoport <rppt@kernel.org> wr=
ote:
> > >
> > > > This a next version of Alex's "kexec: Allow preservation of ftrace =
buffers"
> > > > series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazo=
n.com),
> > > > just to make things simpler instead of ftrace we decided to preserv=
e
> > > > "reserve_mem" regions.
> > > >
> > > > The patches are also available in git:
> > > > https://git.kernel.org/rppt/h/kho/v4
> > > >
> > > >
> > > > Kexec today considers itself purely a boot loader: When we enter th=
e new
> > > > kernel, any state the previous kernel left behind is irrelevant and=
 the
> > > > new kernel reinitializes the system.
> > >
> > > I tossed this into mm.git for some testing and exposure.
> > >
> > > What merge path are you anticipating?
> > >
> > > Review activity seems pretty thin thus far?
> >
> > KHO is going to be discussed at the upcoming lsfmm, we are also
> > planning to send v5 of this patch series (discussed with Mike
> > Rapoport) in a couple of weeks. It will include enhancements needed
> > for the hypervisor live update scenario:
>
> So is this V4 still a RFC if v5 will be sent by plan? Should we hold the
> reviewing until v5? Or this series is a infrustructure building, v5 will
> add more details as you listed as below. I am a little confused.

We will modify the existing patches and send as v5 because some
interfaces are going to be changed*.

Otherwise, v5 will make KHO a lot more flexible as it will allow to
use the tree all the time while the system is running instead of only
once during the activation phase.

* Changing interfaces  is optional, but decision whether to change
will be discussed at Hypervisor Live Update on Feb 10th:
https://lore.kernel.org/all/26a4b7ca-93a6-30e2-923b-f551ced03d62@google.com=
/

>
> >
> > 1. Allow nodes to be added to the KHO tree at any time
> > 2. Remove "activate" (I will also send a live update framework that
> > provides the activate functionality).
> > 3. Allow serialization during shutdown.
> > 4. Decouple KHO from kexec_file_load(), as kexec_file_load() should
> > not be used during live update blackout time.
> > 5. Enable multithreaded serialization by using hash-table as an
> > intermediate step before conversion to FDT.
>

