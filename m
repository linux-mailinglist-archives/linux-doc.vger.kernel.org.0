Return-Path: <linux-doc+bounces-27599-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 564FD99F464
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 19:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9628B22DDB
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 17:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC371FAEEE;
	Tue, 15 Oct 2024 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dIkSlvNh"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7411F6676
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 17:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729014682; cv=none; b=HM4mjfmhLJk0oj/zSYwoaNCAmG546QUihxmMG1hR34he7k6Conx7/fzpu/6PV4NCxghQ6KSo+0AeqHZsVyJRN+sSWUZzxUc/5btwBxhMs9RPb8JAxgIWqDeAwIvO7mYAeqqKlwXV2c1CSRziBkqNw22a0gEHjdPtd5cQf/YkQLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729014682; c=relaxed/simple;
	bh=1YKM3CH5jEHgkpkOmJ9NdqwqHxCL6rD+RoUeOu+M0Zs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kHkLbYudfUtrPTzkgnC42/L3hSYIilH83hoerNuNXMHWe/OkDP7VxWB/K8toK+72f7mAdjfiUOZx6mZzUdCFmH1AQU6avLWlHDBwejKx+G70ZG7ENKKbFpgESrUFTSGkNBnUy1F6r7AWu7dG1PggL8ZouwXjW7qxsYu0OvMpZj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dIkSlvNh; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e290b8b69f8so9213257276.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 10:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729014680; x=1729619480; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LzVsLhNxP8WDtuKH9p/BsiCdMHgFRqj/PD3WiEFxpvI=;
        b=dIkSlvNhbL9+4j+XcSeWRI+T83+mZc6CPPOglRW5LITA2rObSZNswhNjESLOlzcn5N
         deSv6fgAaYu8M+V35Vpc4hwCabyOLQG4pZ7FboKtT3xldJQpiKpwjI72Ye60KEzU9IYn
         HYSITN7ea6wfwaGX0ssvJLJo8tIfeTNOAAnZzjYJNtflx9vp1d47Igy3gqynBGENiabE
         mpV5BOFtdhodpiZIXiWKV8aFuEbaTQyPafCWs20qvrezH0kAbdzcML6CzG5lNa57sOZq
         762MEzqOo7kq9UD31SrjYUJUpdg6jjRNPPh81Px4hFe7YO51vdSKEtT5RZsVRM/VJTxh
         mRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729014680; x=1729619480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LzVsLhNxP8WDtuKH9p/BsiCdMHgFRqj/PD3WiEFxpvI=;
        b=of1DKyNju6PEqEslilGgqrABA5qnEIPcWn0Bk2WhA5oObCLNWcy7VXkbPZu8R2zy+c
         IEle1usEESNCa1WTc3qYMA0sjLkV/ZH5bXdn0cX6baAZayjwotYkC95S/IcE+IxCfYWf
         OuLV/WQTy6wsL7TrNSxhbJjzI7M8s736mE2nNrocw8+PVv40zGS4JlzI8brD9Gvti9qA
         dgebFhOM1r4NZLmy7oRKPal+um4JlsaiZc1Esf7Dd2xqFwEZKzSSgxldKdIrhphJqRwW
         olRDSvuHx9bwHxxCL+bMmpCHJD7E3WZ+nM7avAz78sIF9S7OL/EdS+mga7ZEfBy4AIOH
         N2+w==
X-Forwarded-Encrypted: i=1; AJvYcCXTty4cJQxah0GTe1kSQ5BKS3j508uYj/Q3WKvUgReCf4Tcvb6n1906rQ2hw7ezXyl4gt1Q1vNG7yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIwS3r7FrbhllYEuTegUo8vRBoSp7lp4CiRmQ9f11XZliWXT3
	w+rnyTvYySfPP0wXJLbFNbtuvwbCYpu5vwRNdQROc3r8vpJ4FyvgarFzGnWwOpLwVZaJ44JFo8W
	cgQ==
X-Google-Smtp-Source: AGHT+IEfLUVkB/Zw/tV3P8pzNf5N7b8EpBCnlhsG/pzHxZYrAeEXSX/92lSxXYtVIs6Hmgm0nACho5IQsWI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:505:0:b0:e28:8f00:896a with SMTP id
 3f1490d57ef6-e2978594c30mr546276.8.1729014680360; Tue, 15 Oct 2024 10:51:20
 -0700 (PDT)
Date: Tue, 15 Oct 2024 10:51:19 -0700
In-Reply-To: <D4WJTFFVQ5XN.13Z7NABE3IRSM@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241004140810.34231-1-nikwip@amazon.de> <20241004140810.34231-3-nikwip@amazon.de>
 <875xq0gws8.fsf@redhat.com> <9ef935db-459a-4738-ab9a-4bd08828cb60@gmx.de>
 <87h69dg4og.fsf@redhat.com> <Zw6PlAv4H5rNZsBf@google.com> <D4WJTFFVQ5XN.13Z7NABE3IRSM@amazon.com>
Message-ID: <Zw6rlxWc7UCxJFpi@google.com>
Subject: Re: [PATCH 2/7] KVM: x86: Implement Hyper-V's vCPU suspended state
From: Sean Christopherson <seanjc@google.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Nikolas Wipper <nik.wipper@gmx.de>, 
	Nikolas Wipper <nikwip@amazon.de>, Alexander Graf <graf@amazon.de>, James Gowans <jgowans@amazon.com>, 
	nh-open-source@amazon.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 15, 2024, Nicolas Saenz Julienne wrote:
> Hi Sean,
> 
> On Tue Oct 15, 2024 at 3:58 PM UTC, Sean Christopherson wrote:
> > Before we spend too much time cleaning things up, I want to first settle on the
> > overall design, because it's not clear to me that punting HvTranslateVirtualAddress
> > to userspace is a net positive.  We agreed that VTLs should be modeled primarily
> > in userspace, but that doesn't automatically make punting everything to userspace
> > the best option, especially given the discussion at KVM Forum with respect to
> > mplementing VTLs, VMPLs, TD partitions, etc.
> 
> Since you mention it, Paolo said he was going to prep a doc with an
> overview of the design we discussed there. Was it published? Did I miss
> it?

Nope, we're all hitting F5 mercilessly :-)

