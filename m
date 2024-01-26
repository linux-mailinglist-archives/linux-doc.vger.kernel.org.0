Return-Path: <linux-doc+bounces-7623-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F7383E3F8
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jan 2024 22:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B78AB2817A9
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jan 2024 21:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3552511E;
	Fri, 26 Jan 2024 21:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EmYpnFG4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC50F250E8
	for <linux-doc@vger.kernel.org>; Fri, 26 Jan 2024 21:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706304718; cv=none; b=uUjF8db4juqNxbvgSAtVo6T59Vfhg1cYM2yt2hEOGlaPAfnvJRgqHTE+Do72dvmVFTnUDqtuiAvscXxEtii8xHkvQztO4toHeMQt5QpmZvfRPlu2rreLggktnox/VQOAmhjvMYaf5p//eFDq0+YYf8ZHOm35NooO5Eaais17nO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706304718; c=relaxed/simple;
	bh=pnPJv3C/8oI2mDLaLYSzM3++yh258fHVwIni0iXI++c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dcotBLasGsuaa8/ap9M6C73bIISfXTlb+yk4TsyXihrBuV9v1SrrtxTgtWfALho1ziTm6wO22nB9p4P7uiV7MIoYlXrLmWu9FMdeBqlljVIZ2cQydj/tTJEbzwgZdeJJxK9rd7xMce0up+DVMLtRaGMeC/pY3/49UZG8xlCmJpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EmYpnFG4; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6dddfc137b4so535980b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 26 Jan 2024 13:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706304716; x=1706909516; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xJJmc9xeQcykeus6gCa38Rf/FAKcShuAjnIZq0Hgxno=;
        b=EmYpnFG4Jrv+ozXW22/u1UaQHxP5Gus+V1C0Z7g383Jf0kcG7R4YPkpN++KTo5fNia
         AZ8+Bk8FNUhPa6C+VBIRa+hVeqvrf13YxOSFXk/D+iIHZz18/E0nB6jIsWXZbW6Ueeqz
         XJnsFJd2M26McrEC2s3AHM4Gyf26cHsaV3o0ECkmOSjoiG1+I7ftKVYG0+HGaE3OxKLh
         kou+iFDAqicJVPmlFbvxEFcarr448sbc+fXW8fh77GoJH9znIlJnwEtAcIUw4Nj0GwLc
         jOUC5eS5+JC7UpXp+yafmm8qlDViLlx3t+9jAb4Cc2E0SANzNQMW0X2mmfgiK48erVcK
         r4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706304716; x=1706909516;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJJmc9xeQcykeus6gCa38Rf/FAKcShuAjnIZq0Hgxno=;
        b=NADkefw128B8/Z8gCGHNOA4E/w9++DKL+LZ86rN901zDe0++6XFK+OeX+dozSD2cyG
         rZ2f+NA/SbZ00dDTh/ntbU2e96hSeNoKymP+ZeGZK5UT0AZPr9LDYmM2S/CojMtfw11H
         DaNzIF6mmYAwZLV9fDmBcUPvnYIjjuLJjp+XhLCyea3GBJ3+1mS8Jms1qglbjMk4bmwI
         aF8kCS7lXFGtt/w3HsL634VUKANsTodEIk48nCbhQUXDcqe7lYey0sb4Ijl+xkNah68Y
         J/dgw8cDuAnv8jyDzH9fhfYknlW+Us2rlIohl2KZBQ6++dQeisXDzRb+Yutimao4v9K1
         emiQ==
X-Gm-Message-State: AOJu0Yy2JgSJKwxNLiAXKuXDwfP4OPo5YLzAm9qPL0ivtPYPyMbCRprT
	UTT0JHgPdJT/KE9d5ACemcoxIRW+kudvp5EhcanVNbZsI0ybyKzsNz0/sPtl9389h1zRkWG0h3X
	umQ==
X-Google-Smtp-Source: AGHT+IHlUrVIaAxo07HXP8NgbIsOQ66wMvc8QqlRpVXum/0dlz10VAW3ioqj5+4vJmt6NA0WEqOzKCcyRUg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:9095:b0:6dd:e157:fe76 with SMTP id
 jo21-20020a056a00909500b006dde157fe76mr45718pfb.1.1706304716074; Fri, 26 Jan
 2024 13:31:56 -0800 (PST)
Date: Fri, 26 Jan 2024 13:31:54 -0800
In-Reply-To: <20240123-delay-verw-v6-6-a8206baca7d3@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240123-delay-verw-v6-0-a8206baca7d3@linux.intel.com> <20240123-delay-verw-v6-6-a8206baca7d3@linux.intel.com>
Message-ID: <ZbQkyr8c12jOqWQ-@google.com>
Subject: Re: [PATCH  v6 6/6] KVM: VMX: Move VERW closer to VMentry for MDS mitigation
From: Sean Christopherson <seanjc@google.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com, ak@linux.intel.com, 
	tim.c.chen@linux.intel.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Nikolay Borisov <nik.borisov@suse.com>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	Alyssa Milburn <alyssa.milburn@linux.intel.com>, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>, antonio.gomez.iglesias@linux.intel.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Jan 23, 2024, Pawan Gupta wrote:
> During VMentry VERW is executed to mitigate MDS. After VERW, any memory
> access like register push onto stack may put host data in MDS affected
> CPU buffers. A guest can then use MDS to sample host data.
> 
> Although likelihood of secrets surviving in registers at current VERW
> callsite is less, but it can't be ruled out. Harden the MDS mitigation
> by moving the VERW mitigation late in VMentry path.
> 
> Note that VERW for MMIO Stale Data mitigation is unchanged because of
> the complexity of per-guest conditional VERW which is not easy to handle
> that late in asm with no GPRs available. If the CPU is also affected by
> MDS, VERW is unconditionally executed late in asm regardless of guest
> having MMIO access.
> 
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>

