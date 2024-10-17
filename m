Return-Path: <linux-doc+bounces-27807-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F27079A16E0
	for <lists+linux-doc@lfdr.de>; Thu, 17 Oct 2024 02:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67155B2530F
	for <lists+linux-doc@lfdr.de>; Thu, 17 Oct 2024 00:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9457779FE;
	Thu, 17 Oct 2024 00:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VwZDuF2Y"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0A723A6
	for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 00:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124597; cv=none; b=b+gwmZ7VMnUTEukbm7eNh2I6EgWxD1hEmKF/OveqCM+rzbVRzasjUOK0hV36WHZF3r4lIFjaS+q+DfTEYKMhHLCzesAd1TmLYG4gwiabnceouBIYwbxlY2OqdyYapBZVrUgDvdZF+a+AeBQ5cIYsrfYPcKPX8KS5dfcjkgzPXXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124597; c=relaxed/simple;
	bh=5bW49bD+EKSiVYlir+v4FtgYuuOeWvwSTqfDO39iuXY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tg5GwZacj+q+aloaG7TicRNP608fQQrfA9X2uj92q8q1pQsY5BLKKt8jJFPJh2TKKU+jXfIU1fRzXDsZTEezTMH/xazUGZGrnI7LoeTmLPOko6QCSu2cboAgnX5eZ7P5J0j0dRE/1MJ/vvF8azKxTPpIB71cz6e+lQRzKXnSzQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VwZDuF2Y; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e292a6bdd72so695901276.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 17:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124594; x=1729729394; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BDOAcCratkcKDtlnVKA6PegGNWwglEUHg+hVzvt764w=;
        b=VwZDuF2YT7fi0xmo1Mt+KTwAXQLk381gcf5PzIIJGFsvMvQWrHLH44sDFipZ90tiiQ
         QePbKgw+026CZW4F+QYGxjjl1ysObd++oUuS0dJzLHiAKtZzSWbvm+A6YPRYRd2/7ZNA
         2p55f0/Zua0zBeLW9iMCcBQwGCFrzSxVHBz3hPw23fdNXSy7wlgbP0P6CbUmlpRdkXHv
         f4QXwUxcjF3SfMKFQd5IIXRxIXMGRjYNzQ3TvNT12SIAuQKQqXcjeN9qBOLLBIf+vjt8
         abMi2ujMH8YpSvrLHrTykBL5Vsld4LC/QJKODtUXal5i8Nt7RETlU2lk2z9yTrKX+o5H
         MbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124594; x=1729729394;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDOAcCratkcKDtlnVKA6PegGNWwglEUHg+hVzvt764w=;
        b=wRizTyhsRF0+zOOoviWK7l5yu7uzyUe4KeQmJaua0MZcPphgndCzFDcOT7esKV/e4t
         ypNh5XL4FqsdMBCxaOnZwdOcQ1Jj8J7UpbseqrGZ2XexRylx4LSghmNoqken9iwa5gOV
         z5bqwS1cfrucbd8MCpCuOCC0ZrMkYFRuRRUUIKHpckhsAwV+k1oacSlvRGCcfe5YAk0c
         gbpijSBXeula9sJbGGaJ3pUNmEY3Z1z9Oaxh1u8aoTvDoc+R1Og2r+eeVKitzzlA7KKj
         6zWk2iQAa9RsK6EW0qfySN1vKS5q4lp0ATQuG2DvYEoRyJV829N/egnSEAfruw5DhWtN
         ZKnA==
X-Forwarded-Encrypted: i=1; AJvYcCW47mAlNWLaCMt0bQAjdkI072bB3kd98psy4E2nVKOZagakWKLYcgXtH2Ji+RmGIscgK6L0/vpRDKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgHX7QdpFGUzacZ3HYu5xQWdqXYIY0Fr04GwCs4iGivBB8gJGg
	IRcUkoT3In/e20Zsg2AomAAiv5K6uFGOOcAfAgzzbS6xspNAxtX6GCJHjSmNLqroZu+htBs6z74
	i3A==
X-Google-Smtp-Source: AGHT+IE4l3MvTYNAOyrgYg8GdkVRXTmVWgsHaliM139NqF14S6D92z4C9+5nCmagCDbGXLX8HkyuisI1pSg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:aa6b:0:b0:e25:d46a:a6b6 with SMTP id
 3f1490d57ef6-e297857f664mr5460276.8.1729124594453; Wed, 16 Oct 2024 17:23:14
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:23:13 -0700
In-Reply-To: <Zw6Svts5hqpIoKwN@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240926184546.833516-1-dwmw2@infradead.org> <20240926184546.833516-5-dwmw2@infradead.org>
 <ZvwWM7rQd075o6nb@linux.dev> <408b137dbf60ff4d189cbd98b7cf8cd833579f61.camel@infradead.org>
 <Zw6Svts5hqpIoKwN@linux.dev>
Message-ID: <ZxBY8S6wO7tymIeC@google.com>
Subject: Re: [PATCH v5 4/5] KVM: selftests: Add test for PSCI SYSTEM_OFF2
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, 
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, 
	Francesco Lavra <francescolavra.fl@gmail.com>, Miguel Luis <miguel.luis@oracle.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 15, 2024, Oliver Upton wrote:
> On Sat, Oct 12, 2024 at 10:28:10AM +0100, David Woodhouse wrote:
> > I suspect the real answer here is that the individual tests here be
> > calling ksft_test_result_pass(), and the system_off2 one should call
> > ksft_test_result_skip() if it skips?
> 
> modulo a few one-offs, KVM selftests doesn't use the kselftest harness
> so it isn't subject to this comment. Since there's no test plan, we can
> skip at any time.

FWIW, I have some ideas on how to use the nicer pieces of kselftest harness, if
anyone is looking for a project.  :-)

https://lore.kernel.org/all/ZjUwqEXPA5QVItyX@google.com

