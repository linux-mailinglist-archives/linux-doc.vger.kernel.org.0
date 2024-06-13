Return-Path: <linux-doc+bounces-18525-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 965F5907B63
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 20:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49CB91F22E18
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 18:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06BD14B06E;
	Thu, 13 Jun 2024 18:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t2US+rGJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDF012FB39
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 18:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718303510; cv=none; b=iIfP828eoCLbYWiDPSDsfVPuu7fhQoZ3Zufrur47lTRgqgzw2jc0ySfNc0FxH0X4CFh6KlmL/IKA79giafORtQFSdQ+nxcFXYjkQe2bNUH9t5b2F2lFOrWBUuwwVMenrFelTt3PceyIGw5P06MnGTvU0NBNu0LT/lJgHrQkfLmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718303510; c=relaxed/simple;
	bh=FAMe6ZfN8ocTQz72VF1wxp4zgj8DpMNIJ5NFawO1sOI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=brn5rqL58A2lOgy40C+jnUqydHRGXdINcpGPc1zU4+LeKb0uwnCJqoFdAt7lxuPv9aau/Zm5vfwDZWsnUNaOLMHVATn+lMUi5QblCajry1kmw8OgOMxzCkC3jPuMAUlSkEGmXEKV0Mf7csCEf9uEaZrtzUG9+YGDEl29Ucvu0vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t2US+rGJ; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dfec7058deeso2604266276.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 11:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718303508; x=1718908308; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FAMe6ZfN8ocTQz72VF1wxp4zgj8DpMNIJ5NFawO1sOI=;
        b=t2US+rGJT+tw1WrqvQIBP3/7VKiEg6tkZyQEdACI1XLRpZJ7vM1pp0MVy1geqUYTDG
         ahLUJIggTcbLDrXBns+jVg83aog7ieHnqoe8PBTb3XdEhGMKK6PnCs6N/e3m4cX2EoCR
         XGkJ9hekRet6LaNoGChWGsBmhHVFcAWBRMHoeTFhWdroW502g3kH4EJJrS4HrmzIJNiZ
         VOqj/bboWESATyHP/eNoLfvioKkAbr10vjErh9yBybIMcTVGBXuml3ldCKIrZ6tYWWZB
         agc8AxR+aUsEBPacMIN32OkblTs8oQcvMkoeqkteksCAMAlPZhB6rFJY3Tjmt4pYOaKb
         OkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718303508; x=1718908308;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAMe6ZfN8ocTQz72VF1wxp4zgj8DpMNIJ5NFawO1sOI=;
        b=hLoW31AhLOfX4r7UKbVFPS1vhIv8Eg7/6y++nY5pYu4gy10hZQSuw3nQPITP/niZ12
         BtcIc2qsOZyz3BjEl0rpHzcnaarEARJkBBGluA6jaBPyt3HTUrgZ2p0BkBgz1v/xfjbW
         tegzaPjjBm/WsYjKSaUq8mRJA/GYgTkKHcaKGwm3C82R4VtQxuxE4QrlM98K/2q0rCmC
         IBTJramlfDlVi6FBRnUbN8W7xurMOPcHRPWyiZ3GZiLC5p9Bfh2U3acB37/c466Cy3wS
         INAAMWVw1HDP8zT9KSs03Hl/w4L4VEaaji96U6WHeoc0oC9LGbzgA2FQ5wFuTCFMTfgT
         QgWw==
X-Forwarded-Encrypted: i=1; AJvYcCWPbsyHkfMF6gl8JNQGYq5nVD5hjRhC+QsqsrAXMq2sOIDOGFfMCxV8veNUfSsngRHTMlmkDctixrmsGQtfXUGKmfvpSOdRaSoQ
X-Gm-Message-State: AOJu0Yw7qQXjBUourCdUcSVDig5Z4Wi42Hp1dquc22S320ktgDQk757J
	vA6b1T32FyXM+l3bvO5o9EDQYBqqjPheer8ltA2xgFEDQGFZetSuQdLS/iwPO7yWU4uEWg0g6uZ
	Ojg==
X-Google-Smtp-Source: AGHT+IHJdhDYs97torwnnhU6KnlaCZsdrWccR1M8UsNd8oy3s5V+SSgGLN9j20SAhn7b35SEH2kqBCITkow=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:8445:0:b0:df7:9ac4:f1b2 with SMTP id
 3f1490d57ef6-dff153d7f58mr42781276.5.1718303508321; Thu, 13 Jun 2024 11:31:48
 -0700 (PDT)
Date: Thu, 13 Jun 2024 11:31:46 -0700
In-Reply-To: <20240207172646.3981-23-xin3.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240207172646.3981-1-xin3.li@intel.com> <20240207172646.3981-23-xin3.li@intel.com>
Message-ID: <Zms7EnytQfy_y4mw@google.com>
Subject: Re: [PATCH v2 22/25] KVM: x86: Allow FRED/LKGS/WRMSRNS to be exposed
 to guests
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin3.li@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	shuah@kernel.org, vkuznets@redhat.com, peterz@infradead.org, 
	ravi.v.shankar@intel.com, xin@zytor.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 07, 2024, Xin Li wrote:
> Allow FRED/LKGS/WRMSRNS to be exposed to guests, thus a guest OS could see
> these features when the guest is configured with FRED/LKGS/WRMSRNS in Qemu.

(a) please describe what these features are, and (b) one patch per feature unless
they _must_ be bundled together, in which case there needs to be code to enforce
that.

> A qemu patch is required to expose FRED/LKGS/WRMSRNS to KVM guests.

Omit this, QEMU is not the only VMM that uses KVM.

