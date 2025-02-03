Return-Path: <linux-doc+bounces-36698-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AD8A26417
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 20:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B8161619B9
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 19:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1B420B202;
	Mon,  3 Feb 2025 19:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hll4qKW0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A11520A5F0
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 19:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738612429; cv=none; b=kLCCXXx8U2+e7FqA542Z/lpWeW09kadqQ31o0SHvtgvB34oQ5Gfm5beS2s0celZqCpZNq+D1BDtTWvp+m3l8iC+veaWdrgcmw6kXiTs3ZdpsNhwqW4AiiyNKcG6wOUZPphFI0Oa8DPtMYSiPLErTTUh4kEu51WzYJ3rHBrZUE+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738612429; c=relaxed/simple;
	bh=hxr7jNuqUlPfc59GPh0os0w2bEp50OFtzoYI/kT4GTs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RzieL2dIV0GnnFy/pRc0+vU/albAyHK0qebWtH0xD5IFAOUOteqJcOHmPjIf7FWXLIoTjBul6y8++lzi4OhXVwHwBVV2sD0GV97iZCcme9T0qn38iqNF990VDVtf6BddTihqCfQ2u6U/OXiHbalPvnG98I6mujk3kWcs4W53P5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hll4qKW0; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef909597d9so13424246a91.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 11:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738612427; x=1739217227; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nCEyOu/LOSfPdvr+BVNdN/g0WxtTpzskRucY3ZD/ki0=;
        b=hll4qKW0/MDYaWgct95bovpDKbmfc/9xZPLQHSUmaBUKPEQQsfx8egcgJ8EGg/l/R6
         A4kVGGLIml9y6/FSe476CAuGq/HZTjK7xsFH9t9tgjMpx9Sd7IjvXbpGK4KbzpSnhiLp
         eqU56cKKtrqyBAh4ZhnUhWTmRhghH4Lj4U6+t6xVDa93U6UVNsY9V5FOm2P64+BUCxNk
         gt6/dZS56lOelBMGEz0s1oDrtFnV+sSudxAZSfMuKoXVx4v9+080i4/XVxiteYqkDdI2
         2pJGmIdWen0OGS4Jzt6dYuckNg1qkd1pwvGt+lwyjh69SfIfSRs3yQlQnXFHM/xvanVx
         CY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738612427; x=1739217227;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nCEyOu/LOSfPdvr+BVNdN/g0WxtTpzskRucY3ZD/ki0=;
        b=hHhdsJ8EbrICHZMt/oA+Dm+xjbxMnWsIyShQ1o9EroiHIK0bpoyQruY/m/VAMCR6Wr
         +Sj/xtJYq8TjUHIhKKKLC8GtYze9+LdXMfx+w9FYmGUnY14GuK1iz1w3yhGr6SRFw3Ke
         VyoCafDk6sQIS4XOBaNL65LXWizThxsqgReDZGDAdKOVTH7EgIbQYTVAeNQcJcESTDEb
         2oaniC0lr4qtAzNM5HUqxHNeLsuG+KikDgiY+UPFDrX+/aTGFJT97wD4UlD8bgzHPNCo
         6s7nX411lTyo3R8ZvGOn6p0OWAmoed5lq3RqJCPfQIGG9ckoD834CYOlXLkNCyCDuPFX
         9Tow==
X-Forwarded-Encrypted: i=1; AJvYcCUmTvVktJ2Z7l6+EigjSniGVN9eoSwvYDk48BBCfQi0ro5ZltDwQarC5ypPr87LihvlFbE99aqioH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXA5ntRM9KoBb3/I1MOMEs85Mme/d8UPPphqI5aazO4R3ePdpz
	z1SG7d6/bkiELMPmMozmT3pwb4PN8D3kkxAZiVBbEgwBLmZ3uN6lOcC8HZYTtWgPASvVt4sDzfR
	JJA==
X-Google-Smtp-Source: AGHT+IFc9rZmF1JjMiP844qma6jdZcJ9zwzx2lsRF7TrY+30VoDsiU9sWPM5lazcp0sTUpmilFfzJxD366U=
X-Received: from pfblo6.prod.google.com ([2002:a05:6a00:3d06:b0:72d:26ac:7d0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:140e:b0:725:eb85:f7f7
 with SMTP id d2e1a72fcca58-72fd0bda642mr32932803b3a.5.1738612427344; Mon, 03
 Feb 2025 11:53:47 -0800 (PST)
Date: Mon, 3 Feb 2025 11:53:45 -0800
In-Reply-To: <93df442c-8ec3-43ee-aba1-e770a5b7588f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <b1ddb439-9e28-4a58-ba86-0395bfc081e0@redhat.com>
 <CADH9ctCFYtNfhn3SSp2jp0fzxu6s_X1A+wBNnzvHZVb8qXPk=g@mail.gmail.com>
 <CADH9ctB0YSYqC_Vj2nP20vMO_gN--KsqOBOu8sfHDrkZJV6pmw@mail.gmail.com>
 <Z2IXvsM0olS5GvbR@google.com> <CABgObfadZZ5sXYB0xR5OcLDw_eVUmXTOTFSWkVpkgiCJmNnFRQ@mail.gmail.com>
 <CADH9ctAGt_VriKA7Ch1L9U+xud-6M54GzaPOM_2sSA780TpAYw@mail.gmail.com>
 <CABgObfb3Ttfg6H+_RpNQGSYKw9BLEwx3+EysXdL-wbpd1pkGHQ@mail.gmail.com>
 <CADH9ctAzffvDByS1s2PJoD63On-b+pCnCmER4Nf4Zc=62vkbMA@mail.gmail.com>
 <Z6Eb4PfmmHWFTR9A@google.com> <93df442c-8ec3-43ee-aba1-e770a5b7588f@redhat.com>
Message-ID: <Z6EeyaOZUevXDBiH@google.com>
Subject: Re: [PATCH 2/3] KVM: x86: Add support for VMware guest specific hypercalls
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Doug Covelli <doug.covelli@broadcom.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	kvm <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Joel Stanley <joel@jms.id.au>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 03, 2025, Paolo Bonzini wrote:
> On 2/3/25 20:41, Sean Christopherson wrote:
> > -EFAULT isn't the problem, KVM not being able to return useful information in
> > all situations is the issue.
> 
> Yes, that's why I don't want it to be an automatically opted-in API.  If
> incremental improvements are possible, it may be useful to allow interested
> userspace to enable it early.  For example...
> 
> > Specifically, "guest" accesses that are emulated
> > by KVM are problematic, because the -EFAULT from e.g. __kvm_write_guest_page()
> > is disconnected from the code that actually kicks out to userspace.  In that
> > case, userspace will get KVM_EXIT_MMIO, not -EFAULT.  There are more problems
> > beyond KVM_EXIT_MMIO vs. -EFAULT, e.g. instructions that perform multiple memory
> > accesses,
> 
> those are obviously synchronous and I expect VMware to handle them already.
> 
> That said my preferred solution to just use userfaultfd, which is
> synchronous by definition.

Oh, right, userfaultfd would be far better than piggybacking write-tracking.

