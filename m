Return-Path: <linux-doc+bounces-3531-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BABF7FDDD6
	for <lists+linux-doc@lfdr.de>; Wed, 29 Nov 2023 18:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01A1BB20E63
	for <lists+linux-doc@lfdr.de>; Wed, 29 Nov 2023 17:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013423B2B6;
	Wed, 29 Nov 2023 17:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="Cc5TfHiv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C62F4
	for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 09:00:03 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7788ebea620so357048585a.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 09:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1701277202; x=1701882002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8mgkS00IbNP5jyZ+NO8ODgKFBs6g0ytgBOeKMTZ8ns=;
        b=Cc5TfHivfaAnMCl2wCcKTmQ8V6KSXeBQ94Qc/hQQqHLMx94l/6q7kPVNFzn7Dor7Om
         6r5o64nLBMpemmWLPtav/sto+wf49O3ontvSa18PfOd0XXjiMnKZtOqqCXk4x/3rwyzH
         hQurXNSbwCRv1XenKKEVXvAtxgRL+DXNm9JeEvd+/mwrPPmI5BU/y6SAEoauTneFXVNz
         iAL1/AENwaUWINoEwMac8Z93ItWqw77TbXbLuXyx+HAL5Iq7+JhO6rV8OxiIGkr454FE
         5t/LT3LM3bnUyefxYAHxY4BKVtLnyH7KYRruznsMa0lB7/xjGjzc+fVK8VK3xX62Nax9
         GazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701277202; x=1701882002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8mgkS00IbNP5jyZ+NO8ODgKFBs6g0ytgBOeKMTZ8ns=;
        b=DkIrFcJVXW8QIlW0qLefpCe1dcUBPr6oXRIVSjzsGZ9HlTRq7ujIW99XQ5q5JXZKoF
         ovRR8lDdm6UZUPinQ5LQBA3UFTTwGNSYMGz4wpShpE2IdgynfW8Njn+E4qTX3QSfymbX
         6dBHeHv7IUpFxGIdoeiUXq/u5hZHUVUSh0OT0y6YEbL38jihl7QczFMgL7Ob9juudHSP
         UuKssPQBlIYfsPTMOCcqB/hpfe1NsqSosvCH3i/AvyH6m5L8/FhTN4ZXTrhSJVmyo+5Q
         qZtyo3LcQJe4SByN4aKm9jCuL9W9REdVWNRLV4PnJhc+JtSHc6u/UUy5prUTlpOwrDsZ
         kX/A==
X-Gm-Message-State: AOJu0Yx92QoFF72SxgZ49e6gL/S6YI7+aQUIqdZQSFotzlCtudmsHrN5
	8FRoFNXkJjd5yueByaujlQAqPg==
X-Google-Smtp-Source: AGHT+IFMmcjiCa+i8CW0+x0EBy+ZJodS4kAFY34IuEihW6YJGVum8lmU2DvIyHxJC59g78xXhTu4kQ==
X-Received: by 2002:a05:620a:2707:b0:77d:a0ee:f196 with SMTP id b7-20020a05620a270700b0077da0eef196mr14597254qkp.5.1701277202618;
        Wed, 29 Nov 2023 09:00:02 -0800 (PST)
Received: from localhost ([2620:10d:c091:400::5:ffba])
        by smtp.gmail.com with ESMTPSA id rg7-20020a05620a8ec700b0077d8622ee6csm4397763qkn.81.2023.11.29.09.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 09:00:02 -0800 (PST)
Date: Wed, 29 Nov 2023 12:00:01 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, cerasuolodomenico@gmail.com,
	yosryahmed@google.com, sjenning@redhat.com, ddstreet@ieee.org,
	vitaly.wool@konsulko.com, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeelb@google.com,
	muchun.song@linux.dev, chrisl@kernel.org, linux-mm@kvack.org,
	kernel-team@meta.com, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, shuah@kernel.org
Subject: Re: [PATCH v7 2/6] memcontrol: add a new function to traverse
 online-only memcg hierarchy
Message-ID: <20231129170001.GF135852@cmpxchg.org>
References: <20231127234600.2971029-1-nphamcs@gmail.com>
 <20231127234600.2971029-3-nphamcs@gmail.com>
 <20231129150403.GB135852@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129150403.GB135852@cmpxchg.org>

On Wed, Nov 29, 2023 at 10:04:05AM -0500, Johannes Weiner wrote:
> On Mon, Nov 27, 2023 at 03:45:56PM -0800, Nhat Pham wrote:
> > The new zswap writeback scheme requires an online-only memcg hierarchy
> > traversal. Add this functionality via the new mem_cgroup_iter_online()
> > function - the old mem_cgroup_iter() is a special case of this new
> > function.
> > 
> > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> 
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>

I saw Michal's reply on the other thread only after I sent this.

I agree with him it would be better to just check mem_cgroup_online()
in the shinker callsite and leave mem_cgroup_iter() as-is. If it's
offline, just continue to the next mem_cgroup_iter() invocation.

