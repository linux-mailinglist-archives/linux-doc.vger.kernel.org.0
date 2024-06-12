Return-Path: <linux-doc+bounces-18393-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAD590584D
	for <lists+linux-doc@lfdr.de>; Wed, 12 Jun 2024 18:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FA47B2A408
	for <lists+linux-doc@lfdr.de>; Wed, 12 Jun 2024 16:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA6E16EC13;
	Wed, 12 Jun 2024 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LGoscxZy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2F7180A93
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208154; cv=none; b=kPKijQ3FeW56G3Z3ONj0CHKA7ZxTCukzyt5M+U7jV5QTt9EiMz1n5ApkNJ3t8BBrs7vsoXBo233mpFEZy70JOxTXhlBelTltAWb0bwXGlnawxpyoqo0mfo0QKnYXFVR7BvzqHmu28E0RO8jl/zzo1o6V5JwBuCnc7B/BSaysyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208154; c=relaxed/simple;
	bh=1TFVrwww23bDZwSiwRJ2jYhuVWiPUIMbmY+tTlCjXjs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JdyuqIR8Yhx2DVUcYkxQ+Av/bLzci6jAZO2LgbC10q0vPF25qugXSVhHpFRWnrg7ghUg3k1/rGgu5pPa5pAOX9PLD/S1G3sey66tRpG9U/3qlT9Tx7lJWtm/sCniou0ppYVJm5V6XGUiPYU/awVPMKZRNI50GpAeadCyyxcIxzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LGoscxZy; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-66957d4e293so5437131a12.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718208152; x=1718812952; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aePX0hruEKIOA1+M6OG+w8QdYVFE2Ff801XPria8pOI=;
        b=LGoscxZy6lwkru6Pilm1lF2UQ/tHK+gZWOu43q8UxUWphgVq03Tr44mDFjp4Z3DKDs
         RWuYXz+E9qH7n7JsyvMVNRwHf7i4YITKTNShsUSFUllJft8lg7HAuy1tP1lpyGaAT9Q3
         0UIhPoMlY9GMNpd+mKIeyMqiFDkHXQnVBcdlHQGvkR2FWRFb+h4aR9RkJpVeZIS75vfB
         2VSSWI6x8vXBTec/RUAb0LY5lhCXjV9MHVLJ/ao18FPRB+tCClY6M+gF1Eluzq0H3zaD
         v2Juom3NsZxQQKVVD/sXKLs+B82hY1SoQpjxV7w2KG1HzSqTgbjkr5p0qOqnS6xGguz4
         TJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208152; x=1718812952;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aePX0hruEKIOA1+M6OG+w8QdYVFE2Ff801XPria8pOI=;
        b=k4Am02CT4esply6MRu33WWs5WzUSGWdXSUkutjGZuZwcszgGH509wQyG13vTw+ZI/I
         AMLW3RR7l52WMvrNux0QJ928WAoUvBPTSex3Hrn8/BotP5l1dPNhaSVtf9hsyxRi2b8u
         IVaIrKYtTU9EgV+JylSoEhqaQEY+3eErYzImZZANTo/S3yWf/qiMOAfoAwIwBJ1lwdrO
         lZcnhG/D7CHx0HluceI6OAJ2uRs8IJXBDsM2GnsuW/V8kjp0DACS2/bVd6+PlZD7KJWh
         bOWkMBS6d3kxwLCcebDIyVX0hwnaH+/tqkyY2MPt11XbNB1PgdCJT7uRwH2dugAnOPJu
         8Slw==
X-Forwarded-Encrypted: i=1; AJvYcCVI3KVkL9VBkURe3YjHvSwlD5kDWoHUVxJMW39OY4d2fZYw+jWKZkBKC1zbttoP/uylEyFx6im5zdx2PZYsNK17lXLC8L06k7I4
X-Gm-Message-State: AOJu0YyJfcBDolSAuoZWk7vrT3FIrNvXY9SV9xK8YbKV/8OTm5+MlwoZ
	MXmn1L8uZPh1CkY/LZOFyyQJC+qYFEiQLB0QjHszCD9oPHmH0dx0fpM2Re/TLGS+WCR4OC8oM1z
	wHw==
X-Google-Smtp-Source: AGHT+IG0uMYRLBiUhOc770oDRl2hP1hRVk0jGwiyLvB3wm+pqn+z8Eju9Zd1H20tziFvsazDeHJOkFbkr74=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:9503:0:b0:673:9f86:3f23 with SMTP id
 41be03b00d2f7-6fae0e6eb36mr4827a12.3.1718208151688; Wed, 12 Jun 2024 09:02:31
 -0700 (PDT)
Date: Wed, 12 Jun 2024 09:02:30 -0700
In-Reply-To: <20240611002145.2078921-9-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240611002145.2078921-1-jthoughton@google.com> <20240611002145.2078921-9-jthoughton@google.com>
Message-ID: <ZmnGlpBR91TyI3Lt@google.com>
Subject: Re: [PATCH v5 8/9] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Wei Xu <weixugc@google.com>, Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 11, 2024, James Houghton wrote:
> diff --git a/mm/rmap.c b/mm/rmap.c
> index e8fc5ecb59b2..24a3ff639919 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -870,13 +870,10 @@ static bool folio_referenced_one(struct folio *folio,
>  			continue;
>  		}
>  
> -		if (pvmw.pte) {
> -			if (lru_gen_enabled() &&
> -			    pte_young(ptep_get(pvmw.pte))) {
> -				lru_gen_look_around(&pvmw);
> +		if (lru_gen_enabled() && pvmw.pte) {
> +			if (lru_gen_look_around(&pvmw))
>  				referenced++;
> -			}
> -
> +		} else if (pvmw.pte) {
>  			if (ptep_clear_flush_young_notify(vma, address,
>  						pvmw.pte))
>  				referenced++;

Random question not really related to KVM/secondary MMU participation.  AFAICT,
the MGLRU approach doesn't flush TLBs after aging pages.  How does MGLRU mitigate
false negatives on pxx_young() due to the CPU not setting Accessed bits because
of stale TLB entries?

