Return-Path: <linux-doc+bounces-8543-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E29C84C373
	for <lists+linux-doc@lfdr.de>; Wed,  7 Feb 2024 05:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F4951F258DE
	for <lists+linux-doc@lfdr.de>; Wed,  7 Feb 2024 04:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705CD1095C;
	Wed,  7 Feb 2024 04:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j/uQvdPr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050231CD1E
	for <linux-doc@vger.kernel.org>; Wed,  7 Feb 2024 04:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707279451; cv=none; b=d58xe29iimyUPpmDsMScDefgEj9YvuVHyLlj5FRNugukxtpSJw3InhNMsvQc8uhj30ppUlQEecgkCecTKWFMy1An6W8sapttcggoC67sfef1OAFCecSZ5wC+Lqmi+WTot0c1TX+ymCQgKFt5gDVR9wsX/XEiFX/PCWidsULbnrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707279451; c=relaxed/simple;
	bh=AUe/GSsJccV5uGPLVy5XeDrtLFb96OtRmmTz6qmuBxY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J7dZ5O34kqwwZomXNuTvjJRr2sh29bsjDP/fXVmptCOv0X2XJFZmBIO7MntT+oAjN1T2a3HlmLOaU88rQJOnOO2hlQ+Nj378njjuPFTGq1GCFSGQp0BogfcCCzVUKZX4u7pXu7bGVHimZeaA6pzHZWPrufNoU/QbrFUa4lyZenQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j/uQvdPr; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5cfd6ba1c11so108660a12.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Feb 2024 20:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707279449; x=1707884249; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JMJMGBHWMMeyINCjIXY3OUMUuZgKx0SF/Wat2yBezj0=;
        b=j/uQvdPrwdf9RzAMRGLShRbZYSjZGkOa9lD1X4bfxbGoGx/KlPoC6e8ntqn4oIr2jC
         pURE5W4F79bBelDr7W1cwUqbOMZBkcupnN/6zrGKglwCJx4JSoZRoipCL3A/07/7qKII
         A2i+VranCHLzxCI7w/lEDXBNVo3a2v+xZDnGHqWoU0yoaoXSHEe8oRe1s55GankHraQX
         iNmPS7tJxCgOWUIPLO4yTgHWRQHHidT17o6jBJG03p4TPkim5JksUw6ucnQeMJvwzy/3
         8jSlVoQy41FRLlo1e12SqgP0j41B+S8ZLqNujmAOThV0OGhrPJMU/3T3zmpvCJyIU/2X
         SiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707279449; x=1707884249;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JMJMGBHWMMeyINCjIXY3OUMUuZgKx0SF/Wat2yBezj0=;
        b=HK5HyMscoewg3utK14YyoH3szZo2jp3aH6zFge0eFrLFrSft30ubeZegVRMDD30Vtv
         uSmpOJtNxOYKwaVbD/oHBNRjbe48deJRGnv8w1q205zCOmxfeotKNcGhPhgjtUobqXJd
         bbvtFkSZsfzMqU3L7CaTRxgsUCiZvCUVZMdwJNQV6b5a/D8uq9iVu5GeizHKvnbwAjJk
         Xjw5qgyVPt50+65PaI6NZJgFprGoWGFb+8sy0cfKsHNkACoL05W8rVG+ngxaw6oeKJIT
         iMhvr6zYRKaNpkaLww+nNrPBgFk4L70pX0HtwjimiuJa1kz1+cVllENpRWP6LCWt4abc
         lq6Q==
X-Gm-Message-State: AOJu0Yx2NT7NSsR0gQuyPS77daSNuhMcFtzljh0spO69O9LKAyFE2xE7
	l6bEY6mYdTqejSoViJUfk4g6ZJ/h+cW2sKHZf8xjHUQF44F9rLxbCj6z6QTNfWHO1HDpJ+boWq9
	7/g==
X-Google-Smtp-Source: AGHT+IH25STSEf+EYgwYtJxqeLFylL567AgMD6tkjG1b76SDRJRCs3uWFuOKLRoMfpDEqSUrNHFDYEQU288=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:6e96:0:b0:5ce:715:56d5 with SMTP id
 bm22-20020a656e96000000b005ce071556d5mr3973pgb.11.1707279449266; Tue, 06 Feb
 2024 20:17:29 -0800 (PST)
Date: Tue, 6 Feb 2024 20:17:28 -0800
In-Reply-To: <20240115125707.1183-18-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240115125707.1183-1-paul@xen.org> <20240115125707.1183-18-paul@xen.org>
Message-ID: <ZcMEWMAKCDp5sA9r@google.com>
Subject: Re: [PATCH v12 17/20] KVM: xen: don't block on pfncache locks in kvm_xen_set_evtchn_fast()
From: Sean Christopherson <seanjc@google.com>
To: Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jan 15, 2024, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> As described in [1] compiling with CONFIG_PROVE_RAW_LOCK_NESTING shows that
> kvm_xen_set_evtchn_fast() is blocking on pfncache locks in IRQ context.
> There is only actually blocking with PREEMPT_RT because the locks will
> turned into mutexes. There is no 'raw' version of rwlock_t that can be used
> to avoid that, so use read_trylock() and treat failure to lock the same as
> an invalid cache.

Are rwlocks fundamentally incapable of supporting a raw version?  Because that's
the only argument I see for adding a hack like this.

