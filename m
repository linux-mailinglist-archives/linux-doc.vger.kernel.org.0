Return-Path: <linux-doc+bounces-42050-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73443A7936C
	for <lists+linux-doc@lfdr.de>; Wed,  2 Apr 2025 18:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 857D93B087C
	for <lists+linux-doc@lfdr.de>; Wed,  2 Apr 2025 16:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3FB19340D;
	Wed,  2 Apr 2025 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ke9bkLUu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CE76AA7
	for <linux-doc@vger.kernel.org>; Wed,  2 Apr 2025 16:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743612301; cv=none; b=U+f0pXCx8SG2VbH+qp9Kr5NaF+qqkoH5faEl5vDH9fI3a0E4GxPGaU3CDt2/S44vmSwGyMEBUOFuJGLKczpXameOppIp2HrRMaGilytRAw2hwfZVuIyyLMhlAfri/6qIOEGEexcDs1/11QYu/tb28OnwiFS9TlTeVBhlJH/LNm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743612301; c=relaxed/simple;
	bh=VuzG4R3fGEOVCAcfPoOTUO+6ntcv0bfx+Pvn/LkzyGI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iU1lRslfVIpaQy2R3HiF++krA31Okvh2iFjE3lVBHhTsSDqjKSswlsthULPKQRtxecLW+riHc9VVe/84ixUaQ8/qI6OaiQ/3oFYSvD4pd2FUJfO6O4siPDlW0bZYE3MOAE456SKqKZShU7eQD6WI3xKSNPRQ+DemFRAj6qu6wpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ke9bkLUu; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-72a0de193b2so63087a34.3
        for <linux-doc@vger.kernel.org>; Wed, 02 Apr 2025 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743612298; x=1744217098; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VuzG4R3fGEOVCAcfPoOTUO+6ntcv0bfx+Pvn/LkzyGI=;
        b=Ke9bkLUusWnEJOUAsBBXpRSTnV91FmPVZUpeXNAFTEdC1hzQOD3NUB5snuJ2smG607
         ZmTG+YPY9YpsgzXYw9V9iVPh/AuVqFDckPfwM4QRCyDeroF3nbY8iRYFhi2pxOCr8clm
         +EXNdy7nh/no4wSK/OcfOXfFxqw4Mne6ni/KfOpmmT1JP728EuzLslHfySLB0NF+uwmX
         YxiibwJyp24uR5wh7v8iOX8OxeF+6KcxVZ3mr5c9X2CumN6egDDERbbYkpDzgIjK6ndQ
         yZNs5c5Ho9mM5xHJ+5ZpQ43p/7nh2mM2yZyb9k0i0Ii5fArlBP0XSFTzcTiPQbpmrMXJ
         hLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743612298; x=1744217098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VuzG4R3fGEOVCAcfPoOTUO+6ntcv0bfx+Pvn/LkzyGI=;
        b=gKcqUzGG2hqFWgeOc0fqMoZRq/oPZUWSAJowiBRM4KjRfJ1l08LmzzBAuO6bpyPp4L
         T5vK613ebxaUNLNcvrfvOfKgkkxNXzuQXDOty2elfXqhmqHCEhvEwKXv3n7MpQxaf8QH
         AYlHByyyH+Q13eALpUsCoZ0RypsmYtfkqzF0p/7XOnoIZtIpXdWYIVG2hLfXkwrGOtcn
         SV0T4JkdlYYKlH3Y7X6rAHzh+OlPjfwyFkrdl/tKv3zv/ObwaNqYHPL+WhfjWlasATm3
         T9gqO/9hfsczFoNoWXGykhoTDTJtEpXuOuMprs6Cwc8j9J2fzv9qAOlp8Z9MnRFJ51fS
         uvqw==
X-Forwarded-Encrypted: i=1; AJvYcCXswHMdRy7Bk0qE+HB2YQcWSvW++1JjeHxkfpfpQ4I47xjyQd+0MVZdDgg6idbjC1N4tv1/C6x49Rk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu+VerUMkXQyY3hY9+1l7ldzoeLB5o57/Q2kR3lot5wZZFOpFM
	C8nA81Ld2Ao/BaR1TgJs1t+wXj82t55BI27Q5lzsFVxvRH2WEy3HbFHDO/JEwQmbyAxNBo658bF
	TJDLW52h+PAAVts05dw==
X-Google-Smtp-Source: AGHT+IEtfiQ81dhFjIlo1nhzzYpS6z7yTo9b5I2hiuFriTAYh9htxtNtSS00ENc+Qm/R9+CszjB93qxoNQJ5CKjh
X-Received: from oacpy11.prod.google.com ([2002:a05:6871:e40b:b0:2bc:6c19:c219])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:2902:b0:72b:9f90:56c5 with SMTP id 46e09a7af769-72c6382cde9mr10771860a34.17.1743612298587;
 Wed, 02 Apr 2025 09:44:58 -0700 (PDT)
Date: Wed,  2 Apr 2025 09:44:53 -0700
In-Reply-To: <mafs0tt7eqt6f.fsf@amazon.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <mafs0tt7eqt6f.fsf@amazon.de>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402164453.2470750-1-changyuanl@google.com>
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory preservation
From: Changyuan Lyu <changyuanl@google.com>
To: ptyadav@amazon.de
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, changyuanl@google.com, corbet@lwn.net, 
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org, dwmw2@infradead.org, 
	ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, jgg@nvidia.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, robh+dt@kernel.org, 
	robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Pratyush, Thanks for suggestions!

On Thu, Mar 27, 2025 at 17:28:40 +0000, Pratyush Yadav <ptyadav@amazon.de> wrote:
> On Thu, Mar 27 2025, Jason Gunthorpe wrote:
>
> > On Thu, Mar 27, 2025 at 10:03:17AM +0000, Pratyush Yadav wrote:
> >
> >> Of course, with the current linked list structure, this cannot work. But
> >> I don't see why we need to have it. I think having a page-table like
> >> structure would be better -- only instead of having PTEs at the lowest
> >> levels, you have the bitmap.
> >
> > Yes, but there is a trade off here of what I could write in 30 mins
> > and what is maximally possible :) The xarray is providing a page table
> > implementation in a library form.
> >
> > I think this whole thing can be optimized, especially the
> > memblock_reserve side, but the idea here is to get started and once we
> > have some data on what the actual preservation workload is then
> > someone can optimize this.
> >
> > Otherwise we are going to be spending months just polishing this one
> > patch without any actual data on where the performance issues and hot
> > spots actually are.
>
> The memblock_reserve side we can optimize later, I agree. But the memory
> preservation format is ABI and I think that is worth spending a little
> more time on. And I don't think it should be that much more complex than
> the current format.
>
> I want to hack around with it, so I'll give it a try over the next few
> days and see what I can come up with.

I agree with Jason that "nothing is ABI at this
point" and it will take some time for KHO to stabilize.

On the other hand if you have already came up with something working and
simple, we can include it in the next version.

(Sorry for the late reply, I was traveling.)

Best,
Changyuan

