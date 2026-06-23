Return-Path: <linux-doc+bounces-93157-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BEWONanOOWoSxwcAu9opvQ
	(envelope-from <linux-doc+bounces-93157-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 02:09:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5B96B2EC3
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 02:09:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=gO8kormo;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93157-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93157-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 615433031AF1
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 00:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277A5208D0;
	Tue, 23 Jun 2026 00:09:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68C1125A0
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 00:09:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782173346; cv=none; b=E5cxAE9TffUp/4OSdFoqQZ7yW64AbuctBR94+NCwW60YbUttL7OR4G5p7ndA1wjuFVjQPmrNkhhRorFC5PzGkQV1cho+xiVYGY4wvYW8VxFe5xEptMb/FszHJG+AMqZHwRtV4yw8CyL9ZXPsuBF1JiDkPUhgA6xibrtgM7MjBNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782173346; c=relaxed/simple;
	bh=yd2+TEOv7FExuypFSi9d8xWFqZaT8pV4kh4tpwR5c98=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jh+8XKc82erXa2tRaphSDIFAn6wr2KRDEhq7YknOAYsft5JZzsVWYeCf8cpFyVlD6RGpk9NOB2r/fvgXi8YSEotl8JCPqwSuPAx5YtnmikcLhRLx4kt7w5+Ozv+Vv1x7uIrhuMDLhgsM4MAPGcketOxLlgbnQi+EPj5VNLety58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gO8kormo; arc=none smtp.client-ip=209.85.214.202
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c7403e80b0so42835915ad.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 17:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782173344; x=1782778144; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TDYTMQB3fQDmgyevIQsrlSuuHRIIVN5YGJEE9Jzg0yM=;
        b=gO8kormoM1600hw6wApml3oRPggplSFcmTscSLVOKhtgOtU1bgaWFM2T4pBfh1m9NA
         jWQNdAEMcN/jF2W3qHdFh/qt3grUJ6WrSTkHzQmROQnGIcjVROqiJKidx5VRJMwyb5ra
         MUBhSY1SPGr9Oa4bxjBNORKgoXd0cMOXu1vFhpvfI09tLu+uzFwwKgYnNHapEyHT7BOr
         R48vAPNLqr0N0P2ec1g0Tic/RLbeg2wcYoovx6MGpHMC4vuKLVG9FLGDH+RPDJp3TjrO
         tcXacYbqn/CwnRsyqnTQ8X2G4wSu9iA1N/gd6dhKD+0McZHMfopffIbCSCGXviA0DbjT
         lU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782173344; x=1782778144;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDYTMQB3fQDmgyevIQsrlSuuHRIIVN5YGJEE9Jzg0yM=;
        b=F8zj4StYbUiKXcmuulwYRMFRRKDAuu+guymPwinOFiTPP7ccEib20mpp2f3y00RHY4
         1+Rtz3nbeceESOeFk3dijS3qxJzgyr+UvQOUJgNdHJTqqL1aTy/F/opMLQfNeQMgTiKz
         jkdqlPt2nxmLkWdKHel34ESkmQ89uRkPeOXTsghyrnNv3H/Z9vV8Zr98PDzsAWsNw9mJ
         P3GP1DcMRvCECBY14t7627FeJtvX0O4IbpgcWdoqIiZWnaa6OkBxa3knMgwmg8x4ynyy
         01qymBwsVvelLu68L0Mc0joxRYywFQG7fEeD5EeXo+kuf+h/fPc6p3nywWYQHXs+UIBH
         tEww==
X-Forwarded-Encrypted: i=1; AHgh+RqUtuNvR8OpJMaSVaTFxPXQHT1RRdmP7uMcd1sVrKHdJnX83UzcKVsk27M43rirm0nU+0DWGUFD3s8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy02QmTpGTHjHwKUJIpJIRqqTMB+UpYWlAEJZ8ynFoZJHU1+8Le
	64H6i2mFsfZ40mHoXJ0Di+VTQkDF9QxDYuLDp2A/29bMwOHZXcv5E1QKqR04an1r+wZoVChXbid
	8ka53yw==
X-Received: from plae21.prod.google.com ([2002:a17:902:e0d5:b0:2bc:bb08:92dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e881:b0:2c6:cd96:6a8
 with SMTP id d9443c01a7336-2c718f3fa54mr191868605ad.30.1782173343880; Mon, 22
 Jun 2026 17:09:03 -0700 (PDT)
Date: Mon, 22 Jun 2026 17:09:03 -0700
In-Reply-To: <CAEvNRgFEHciT3T9y+qEYRvXhDwfrggoU7Rm=f9hT3OrV+wgpNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1780676742.git.tarunsahu@google.com> <48777f4749fa43d5648085dbb2037aa99c144a88.1780676742.git.tarunsahu@google.com>
 <CAEvNRgFEHciT3T9y+qEYRvXhDwfrggoU7Rm=f9hT3OrV+wgpNQ@mail.gmail.com>
Message-ID: <ajnOnzdknfwbuJ9g@google.com>
Subject: Re: [RFC PATCH v2 06/10] kvm: guest_memfd: Add support for freezing
 and unfreezing mappings
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Tarun Sahu <tarunsahu@google.com>, Jonathan Corbet <corbet@lwn.net>, vannapurve@google.com, 
	fvdl@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, sagis@google.com, aneesh.kumar@kernel.org, 
	skhawaja@google.com, vipinsh@google.com, Pratyush Yadav <pratyush@kernel.org>, 
	david@redhat.com, dmatlack@google.com, mark.rutland@arm.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	axelrasmussen@google.com, linux-kselftest@vger.kernel.org, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:tarunsahu@google.com,m:corbet@lwn.net,m:vannapurve@google.com,m:fvdl@google.com,m:pasha.tatashin@soleen.com,m:skhan@linuxfoundation.org,m:sagis@google.com,m:aneesh.kumar@kernel.org,m:skhawaja@google.com,m:vipinsh@google.com,m:pratyush@kernel.org,m:david@redhat.com,m:dmatlack@google.com,m:mark.rutland@arm.com,m:pbonzini@redhat.com,m:rppt@kernel.org,m:graf@amazon.com,m:axelrasmussen@google.com,m:linux-kselftest@vger.kernel.org,m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-93157-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F5B96B2EC3

On Mon, Jun 22, 2026, Ackerley Tng wrote:
> Tarun Sahu <tarunsahu@google.com> writes:
> 
> > This patch introduces the freeze on gmem_inode which prevents
> 
> Can't find the reference now, but commit messages should take the
> imperative mood and avoid "this patch" [*]

From Documentation/process/submitting-patches.rst:

  Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
  instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
  to do frotz", as if you are giving orders to the codebase to change
  its behaviour.

Documentation/process/maintainer-tip.rst and Documentation/process/maintainer-kvm-x86.rst
elaborate more on the preferred style (I do most of the guest_memfd maintenance,
and so for all intents and purpose it's bound by KVM x86 "rules").

