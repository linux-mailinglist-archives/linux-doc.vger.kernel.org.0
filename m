Return-Path: <linux-doc+bounces-9073-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BC9852113
	for <lists+linux-doc@lfdr.de>; Mon, 12 Feb 2024 23:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77D641F23627
	for <lists+linux-doc@lfdr.de>; Mon, 12 Feb 2024 22:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847B34DA09;
	Mon, 12 Feb 2024 22:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f/hD+jRm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5A4D5A5
	for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 22:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707775818; cv=none; b=MR0oD4BGJYjpE5XPuPv2Tx0nCTpoEWj5GZb9+t4k/RtQg0bS+kUQzYaUa0X25MyMTSxa8IjZqXWGA50Jlcu/ptWYUE5g61suZTDkCwqYfOs5qI8KUpxc9HaD+YnHIdb0qVQECGOF0QoPRZ+9QXRDwZ9zjjiRxfBha8SLeRkT2CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707775818; c=relaxed/simple;
	bh=x2dB2HwYcw6FEFcyt88gNSz8C4rxKf1AxqpiQ+NBli4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrKPn9SE+IFQNkWI2W0ypKQsQq/ouhJQX58uWOM+IZnYFwIbiww1uiAVyUO0B0B1+qXGx2eouAOoIl+JF+eJYcn+GJhn1lHgfbJ+kcFAChqZejRWeh5chhYbthk0com/yLo7fHUumr3n5tez+FK4n8jvR6oMK5ksr5t+z0JRHTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f/hD+jRm; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e09143c7bdso1848253b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 14:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707775815; x=1708380615; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SkGi1YlkpzrNgkK7fsGdO+nBxolzeU4HsB6lcpcl19k=;
        b=f/hD+jRmmD/nslR6LOtigo4QXPAJUg77aKa0j8xZ6fJ+CLUWVkHvb1gZf5oN8WqpPg
         dE6jNHmvvmbX4CPhzwJqU1rqN1Vu1cTaDW4hmAZb8bNPcTMzPNdvxcvcA5FSeqzyt72g
         KlBKpWvqMHamP/P8cqIPHy2pvlpoEOQcPKstg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707775815; x=1708380615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkGi1YlkpzrNgkK7fsGdO+nBxolzeU4HsB6lcpcl19k=;
        b=EJOUBWgIsYui7lKGhXdLR8FjISktnwv6+vp4FsArD8MzyWVjQ+Z8E5LW9/yhJjZ1cb
         IFEiJSr2YeZm4l+DP1XjF9Ou2zeTKtGRuhOy0/cCL/NUFERnJM2oO1Ek7vANenn3G7Li
         vtdj1E7eIU15oaHtHTCjgWX2YmD9m3TGKzErMtNjuB8ca5b2x8vPRC+yL+cnLS4r+eqk
         8ZEOHc2UHK8eaAVZNI8BX4SopRKSryI28d3jJ1byQQBcYFPdF2jDrzjGCsa5eu7LJS7C
         i+F1ipEapWPKFtYNCLnVp11sAV91UBvPgozi/2Mfc8bs8kZCm82v7h93rGYzgeUBc+Mg
         dd2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6uG9lNuqt2vvjoxsSo+MDaHOPdQ6oA4EeMKp16VOYvqZVCt8JQxxlTo8Q4GqcqvabdGkWJxS6+jus1nfPGksl+6ElL1iqMviU
X-Gm-Message-State: AOJu0YwbcP8514Jr68E4j8x8+NdLDFsTDFJfTG3rouahWFfjmKqKJqnq
	6MK775lEJl8/74HEcuxvRkx2cF5JzNPtK0MICrjSgsdl7fZ+wMnhsDzAckzf5w==
X-Google-Smtp-Source: AGHT+IHpQno5Gs03vrNijZSLYd7CPW99yv7uxK9TZvUe9tkILhybemJJepHKCzS3OyHmktw5rKj2Aw==
X-Received: by 2002:aa7:98db:0:b0:6df:dde5:6029 with SMTP id e27-20020aa798db000000b006dfdde56029mr6510317pfm.19.1707775815028;
        Mon, 12 Feb 2024 14:10:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOM1Q1oyTIbMIm3/8NgYuKUVkfTyBovJtGCm92Dn+6W/OCl9Nrv/9i724olnZ5KO3Fz5WtaYNAxg/AWzfjP4i6FjATD/SDxSr/7MuS07SgqtcyB+KBkjG74OXwCYRnrUCULqm/FS1x+sDsfAtu5s6Kk9iGqitIj4DucCWD8+Hl7h+hD17lQD7sNGOUbVALXnbpIsgXE+6k9TNDm2VZqP1caSvISBQNoE5caPtC23Ze9Rpx+Gy1DKQW6uVG8x/pp95bOikO0VDHbBRFvlHuN1wOhy02IGklmdfe4h55X03v7DqS+SOQ/623AhBZyVQ31lQ4xSd6Qt0Z/YpxMLduBeenZOufyU3HUaY8oQjZb7JQQIODmDHwUbepfiMNs+GFKMo6YmScsmqReF1sHoBGSpV0Sdv/8rYGdPSMZG1XpAooQEr++lm34XyeYmZKniSFeLuTEEq0bYTHwevd/8a3xdOwtmuY+OrRGw4OipMEe1qbiuJDEtXWuFvwQ2gseYYcqX0Mmb5sma7UrIoA78CngK185TpVFMCib6jjPZmKaOU5oWUrMVPwtChDDSkb/8k0l8hdSdJyz+tcq0aiBX6NDtWHVtFZ16gGOHy1doeBfWMHyKWwFsraOU1+xUE6dqPg+aliI9BzB7SiLIDJ3fOw4wmqBnXROPnqBVbHUGPrLJvvvEwsBbfzcKgjdtOHKHfJam1UoC1057u35AfN2U4nwohU6ExKIcdFgnYFlt+7gwEzYI96N9vuVVfFr6cGfdoD5EdsOJ4yxoeWOQ==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z10-20020aa79e4a000000b006dae568baedsm6042528pfq.24.2024.02.12.14.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 14:10:14 -0800 (PST)
Date: Mon, 12 Feb 2024 14:10:14 -0800
From: Kees Cook <keescook@chromium.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	mgorman@suse.de, dave@stgolabs.net, willy@infradead.org,
	liam.howlett@oracle.com, corbet@lwn.net, void@manifault.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, peterx@redhat.com, david@redhat.com,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org,
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com,
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com,
	ndesaulniers@google.com, vvvvvv@google.com,
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com,
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com,
	elver@google.com, dvyukov@google.com, shakeelb@google.com,
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com,
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com,
	cgroups@vger.kernel.org,
	Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Subject: Re: [PATCH v3 04/35] mm: enumerate all gfp flags
Message-ID: <202402121410.2AC4CACAE@keescook>
References: <20240212213922.783301-1-surenb@google.com>
 <20240212213922.783301-5-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212213922.783301-5-surenb@google.com>

On Mon, Feb 12, 2024 at 01:38:50PM -0800, Suren Baghdasaryan wrote:
> Introduce GFP bits enumeration to let compiler track the number of used
> bits (which depends on the config options) instead of hardcoding them.
> That simplifies __GFP_BITS_SHIFT calculation.
> 
> Suggested-by: Petr Tesařík <petr@tesarici.cz>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Yeah, looks good.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

