Return-Path: <linux-doc+bounces-95216-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6rZ3Ng/xS2qQdQEAu9opvQ
	(envelope-from <linux-doc+bounces-95216-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 20:16:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D6714617
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 20:16:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ziepe.ca header.s=google header.b=FehRhRiV;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95216-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-95216-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9DB43001D7E
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 18:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AC841DEF1;
	Mon,  6 Jul 2026 18:16:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C8B400E1F
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 18:16:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361805; cv=none; b=jSBWkdJmDbsoxOODCscYgMbOw60OUKyTbp5KzmKOGCwL+TY15GTZ8mFgd/X4KpeRoZ2HZTkQ5vXEfR+J3t2A9cAejMUqWgNuT7BI9cD1o9CBk6pn3jk7uvW/+ksEo/hkGRwng4VYsrrHkLVM99vna27JQoZcU7SVrwzj2vFA5Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361805; c=relaxed/simple;
	bh=XBxMi0JruZRfOpKBpk8TTN47HygeQas2rW6X95AsLZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzIFiMgTJMLTcQbi1OPWzcwHd6Xv2ZSbnFAJDcDPkn+JEUWZzXibfX2T1T9QAQ5gzsGT/baYlDB3SMCu9mTNuEmXrVu4VqYOLa+AnMYSGQEnJGBibU6cgfgPxkhDfgXzUpXG1v9/g5jlQCOXnyN1D4o9beavUl5zFEbv5yDKBqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=FehRhRiV; arc=none smtp.client-ip=209.85.219.43
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so23704556d6.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 11:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783361803; x=1783966603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XBxMi0JruZRfOpKBpk8TTN47HygeQas2rW6X95AsLZ4=;
        b=FehRhRiViCRvs6KWCYlxLKVPllj/RBP1vFb7kDLqghWhOb/EXWfAnu0dE/lldlDRce
         Zl+VyEuaWEYXPqq97wk2nLqiifcGBWzhrmkmitr5tErtWIEi0REw7ZVuk1Vun4PgjQOV
         yXySEw97AeYeQkdU3B6TEOUgO7zYAbEIOLD+yOuMCkoc4blTkC5hwgZu7y+85EJo5QDn
         d2Uk0veJHIQYlJx+VL38M2KkXmAsdd8G7vvAAmII5uEimL8ou8Wnz5gI3W6QRbO4V1EW
         tHs/SEM7aWrpytcfgNBa3ab8RBbECpq0XwhES/0eFbJuPYCNcITIp27aMdE3zPQqzwiZ
         6SiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361803; x=1783966603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBxMi0JruZRfOpKBpk8TTN47HygeQas2rW6X95AsLZ4=;
        b=KlhZcvENdprfigDnPGuzR/UcGUXiZpuJ6omMQ75TYdgBKd1hCdRWhljw8B2h2ZH9TZ
         NAS0kmv//d0NN//2E8kljSatIHdVuT7bDRcoltHRxeY6a3SzfrkamV3/DtyUStPUyULl
         9eCGr24b+XBbCJA2fTuRD9aaC1H+Ekm/MFpWx0vburuNmj7BsqYj0rNv8txR/nPSJ/1J
         /CvXbjDvVBv3SbE5Gag3nrv7wr1AjDJ5nv7Ft8EpKLCSJjdPcmcdKwFpLwie2JMUjnB/
         rrgU/VwhVToXSbafKgcqh5imUpxW6Y9gqjd0yaKHeaylWBCoxP5CUp34XqZYQDz2/XMX
         pTjg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0V5FI4HdZsj1kjDylnN9k1YwmAGOP/9J7oG57EsBBqxtXTGXYqUdvmhdIqqM/vDKS5YLvZn7Njkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy73gDEeJvR+duCukGnxgJMxdbj/lWaklQCPOMhza7sQSIbBoqp
	K+yF5BPg6cAJKK//RlY+GGC2YKON/14FfD8B6mx/Zu03ZXO46XGi6kDWcJB0ESKbDEA=
X-Gm-Gg: AfdE7cn082WkiFixtR6edfNbUa3VQlqnhgO97DuH+y95JNlXsmNfZKuaJktpikn/MPn
	RdkYwOPafTR8R6CMM9xQtFOXdFTIeFNf95PrM9Vz526C6szuHqr9+VNN642TEREtJTj8onk0Ydm
	PNACnfuZ5tM1ZO1okE5hBtBYbCaub6bd8JQZfTVqgaOTq3O40+nJg5LEjXR+Hj2B9BkymCzuCrP
	GBvks8f7lPAtBBVJ4ZjLMYFL5B0Zi1aJXxUDonkK3OAH1w+l3ogxwIHZh/PaN+SijXqPVe4kruc
	ip/IiC3LGbMvv4zizdFJ/GIMQJUpG00ZJAZmE4FJc2gqHs7ycdodlIv2ucUPgKtLK7AYu1pHDCc
	SXe6VIsv5iEDvM2u7LXEzohYSiBEynBHJU9fEMXANzi/57L0wkpa70MpuIh6MXyuj6V7w/Hs=
X-Received: by 2002:a05:6214:226b:b0:8ee:b05c:596d with SMTP id 6a1803df08f44-8fcb336e9fbmr21380346d6.22.1783361802525;
        Mon, 06 Jul 2026 11:16:42 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f4724b9ff8sm139929466d6.40.2026.07.06.11.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:16:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wgns0-00000000dbb-1jFq;
	Mon, 06 Jul 2026 15:16:40 -0300
Date: Mon, 6 Jul 2026 15:16:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, david@kernel.org,
	corbet@lwn.net, leon@kernel.org, ljs@kernel.org, mhocko@suse.com,
	rppt@kernel.org, shuah@kernel.org, skhan@linuxfoundation.org,
	surenb@google.com, vbabka@kernel.org, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	longli@microsoft.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v6 4/4] mshv: Use hmm_range_fault_unlocked() for region
 faults
Message-ID: <20260706181640.GC118978@ziepe.ca>
References: <178336023903.504354.7500950448226027718.stgit@skinsburskii>
 <178336052192.504354.1841795575701703197.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178336052192.504354.1841795575701703197.stgit@skinsburskii>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:skinsburskii@gmail.com,m:Liam.Howlett@oracle.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:corbet@lwn.net,m:leon@kernel.org,m:ljs@kernel.org,m:mhocko@suse.com,m:rppt@kernel.org,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:surenb@google.com,m:vbabka@kernel.org,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-hyperv@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-95216-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 797D6714617

On Mon, Jul 06, 2026 at 10:55:21AM -0700, Stanislav Kinsburskii wrote:
> Convert mshv_region_hmm_fault_and_lock() to use
> hmm_range_fault_unlocked() instead of taking mmap_read_lock() around
> hmm_range_fault() directly.

Please convert all the trivial users too, thanks

Jason

