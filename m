Return-Path: <linux-doc+bounces-29225-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 063409B6687
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 15:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A57F51F2129F
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 14:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DDF1F4FC5;
	Wed, 30 Oct 2024 14:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b="Kh72ghVR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454901F4FA2
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 14:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730299941; cv=none; b=ZySi7w8MjgYMybbEov99VWetExuRig0YwrDjeuC0OtnEUmmOAd4kjYKjdDqDPWrPE/157S03yZ4Lz9yDyCF4phX/juKYGUAUieMTCk7Vh6o6dKPuNLKDCZ6uq2RGZ55taFtShmV0g0AhwvfF8xMCBNFfJshgcQeCn77jOHIpabI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730299941; c=relaxed/simple;
	bh=/nTu4yiVBod9F3pqX7RljXeoBuJmAXaC0LVBlRDlCkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSUJWvoiyCn4lh07ftBVXE2jlWq/wQHRLSSl4N4f0CF2mIg5T2geLIzB2NzExX1TN0JDYfE/eD3nimo7IuRbfvnUB515CmQH38C3jGQF+jgNe9wseVzY3aWUkama8qFh8xPYFpMtLb+6wfxustkSsIMyOphHtnnA9IMa1WuJOcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name; spf=pass smtp.mailfrom=chrisdown.name; dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b=Kh72ghVR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315eac969aso6808785e9.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 07:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1730299938; x=1730904738; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SSvlJM/OhJQtJUJbC46VqSozyrQEBY8ZBkPG7MvxSU=;
        b=Kh72ghVRwv6AbQYUpvgeinsM/cRUr/Y05PmhrB7H/zoT6ux+f/CROtLZ+LQizV7w/H
         6GDrULyqtR2l02zkpOxgayksZCTTgro7YWsy0RndvIP20l7PfRbEqLO9Ivg0byXsETDZ
         /LYhy97lDTL0FSAg4Ay+UA77NgVGQbguh2SNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730299938; x=1730904738;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SSvlJM/OhJQtJUJbC46VqSozyrQEBY8ZBkPG7MvxSU=;
        b=VIiFAwLkusTzlTMA0XScY05KvSXDuohAAyIbOPzK+y09Gj5RGjZnELs2h/SOjpr8fm
         dwS4WQI8qwfdcktXtJdIlrREEmIyKb359siIRZlPAY+K0z1l3gHWmdUCftr/3lx+H2BN
         N4kLfDxtEywzSyxIxqaL4BUTQ+ztFYwjBwcbwcBLS6zRURAFgbIyXeB0Gi++cJJ9J0eS
         VtV/06vewG/7kc1TmL/SpkQI+K/s41G4XhoTJjR5rN1Ip6Kzlew0DaswVA5NABB7l0Bt
         CKaGLDCLfZlqJ2XDzKmPhI5sSP4HAORiUHRWwl3oY+g1x2VMqAl8oJ5UatHeTPhPLFh6
         HRkg==
X-Forwarded-Encrypted: i=1; AJvYcCXvcT+zumZsFqW8KuG+dIIHTH2t/FHe2lgD0jCWg0g2BmIvwfkEfijgKeOPW5/9bT8OlRWXUXJaoBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyewy/kcc0fmKHNXzARFfE6cDw6B+vBVKCfZo8f1dFnAOSSDJiw
	JjSH0SMQKY6cXk8RhuLoKsIgKhBDSv7/KojE3DZdQ47m/V9zADR5NaxvU4HfUC8=
X-Google-Smtp-Source: AGHT+IEAajtEtz+5vxf3sLgzdnDhCBIDBSA638FA1MLL1J8zLQtfa0+HFp2WolOX0nhmzzXHkrJHBA==
X-Received: by 2002:a05:600c:512a:b0:42c:b98d:b993 with SMTP id 5b1f17b1804b1-431b5704cbemr49907195e9.2.1730299937500;
        Wed, 30 Oct 2024 07:52:17 -0700 (PDT)
Received: from localhost ([93.115.193.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1c3absm15638414f8f.21.2024.10.30.07.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 07:52:17 -0700 (PDT)
Date: Wed, 30 Oct 2024 14:52:16 +0000
From: Chris Down <chris@chrisdown.name>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: hannes@cmpxchg.org, nphamcs@gmail.com, shakeel.butt@linux.dev,
	mhocko@kernel.org, roman.gushchin@linux.dev, muchun.song@linux.dev,
	tj@kernel.org, lizefan.x@bytedance.com, mkoutny@suse.com,
	corbet@lwn.net, lnyng@meta.com, akpm@linux-foundation.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v3 1/1] memcg/hugetlb: Adding hugeTLB counters to memcg
Message-ID: <ZyJIIEEWTXKysQLi@chrisdown.name>
References: <20241028210505.1950884-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241028210505.1950884-1-joshua.hahnjy@gmail.com>
User-Agent: Mutt/2.2.13 (00d56288) (2024-03-09)

Thanks for the detailed changelog, it answered a bunch of questions about the 
general semantics I had.

Joshua Hahn writes:
>Suggested-by: Nhat Pham <nphamcs@gmail.com>
>Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
>Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Acked-by: Chris Down <chris@chrisdown.name>

