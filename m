Return-Path: <linux-doc+bounces-28840-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B0C9B2CB0
	for <lists+linux-doc@lfdr.de>; Mon, 28 Oct 2024 11:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5E601F2145A
	for <lists+linux-doc@lfdr.de>; Mon, 28 Oct 2024 10:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37FC1D0F56;
	Mon, 28 Oct 2024 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gPkBnhCi"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3534192B81
	for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2024 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730110932; cv=none; b=cMqwCntU8rX0SvYB4H92GqptUIh8ldQcioQhlaEdLFbyTKEGjfK99//e3v8/KdOibvEpaaxOmSvcAwinBWZHZO5O8f1zdB5vBv0BbK8s1cUPf3Xkum0obFdHxpK7VXrMWXjkZ38oEnLmuXdyUsRl5Ld39f6KTleCPnJ/4QkpHPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730110932; c=relaxed/simple;
	bh=zzQI0ybI4KPvx0KGUmFyOvLHGQJA9P7/hFz4y1bc7uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rL+AEHxRy+W/RThMPZk5FsxZiCr2/LTmiQ4yog78Ddif0Ta0Z81SHgpB960UJBjZsQgYdAR+yJKyhcKPFGMh2bXeoaKJnZGYaX0ElJpNEa1yMIB+/Smk5mL+mVmih+PCdXq5WqnqaaveQLz0tr4Af3Z5+MdWxDB01E4AtWXU5YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gPkBnhCi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730110929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fuiFSGsUISRZ4rT4df5tv8vlp7keS7frwhZev7086vY=;
	b=gPkBnhCisucrm4IX8v99ZgTsJHBoULOq+6TNW3t+iv4KYfIuDGppP+CfWMpWlDDxEL2yk4
	IxPbCk3gSUehMaTMHNBNKdzAcvY5+NyVb3xBCwPvKYvDKQjZKLfiVh7Yyx8YIox3v4v03r
	2A8G25sblcOk2wtTPyt1YbF5LAfSlXU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-NvB0uo6sMS6xLYNvEIiJ4A-1; Mon, 28 Oct 2024 06:22:08 -0400
X-MC-Unique: NvB0uo6sMS6xLYNvEIiJ4A-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d45f1e935so2330185f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2024 03:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730110927; x=1730715727;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fuiFSGsUISRZ4rT4df5tv8vlp7keS7frwhZev7086vY=;
        b=ncxZXu46pspDxh1hWdUsMX9OX8nuhFcZHO8GmosYqv+VMPHyXYsZDRrHVS/1GS/x35
         dj3nUSnBKgtZMlJS0AZeGqDP6uPO1xKHhQ9ZGgFGU/R6VAk8f1hHJcOmn58DAnFVJfp6
         ZKD8b1gDOnpZ2V8yV1IhcHnrWWtP05ssqPEoQfXXgKWZ4nRt6zCQ/NSKwzK20Ld+zlbU
         U1vo4LcYYoYcrV7BKtnziaP/Wp8wKC6R5n9PcRv5CWB0JF+2uL59fp+LRLiGHzXlPBS1
         Z4RzRD/qoHN3WNLZ2voRrnYOj+Z0cLeJxbZEroB1tsDCCh8B3j5XstUzll0HEsm23SjP
         O4PA==
X-Forwarded-Encrypted: i=1; AJvYcCV9i++w2lZx3Ifjjd1NUpTt+xLt7bBScDhTpE2EJ6yFtewczl6glEs74tAvnuRW6qDnPL4TjbJ/MY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGN1KXqSuz0QwFmKj/7Zpzp5JGlXs5Ik/JVF6/AcQ+svhAOQTM
	7DqqFTOIcfybCGPH1qEL4FHKqKwdYvfajTI8rf6LM6kkURXauSyX+8n/sNqA5LsyU7FxmoRHWjD
	0LKfP4oDTkxxx3lQgpB9XL05Ijl8GuIObBFw86pLvHr2hvuc7+g/FcgyzEg==
X-Received: by 2002:adf:fbc4:0:b0:37d:461d:b1ea with SMTP id ffacd0b85a97d-380611ef3dbmr5454994f8f.48.1730110927299;
        Mon, 28 Oct 2024 03:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqHGN/n0Yj5v745GS9Jlm3ZDkDldCmmWyAXcowgeCBzN/fu8QX7Ognj41PjRQlj2fQuwJDiQ==
X-Received: by 2002:adf:fbc4:0:b0:37d:461d:b1ea with SMTP id ffacd0b85a97d-380611ef3dbmr5454972f8f.48.1730110926867;
        Mon, 28 Oct 2024 03:22:06 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b92f11sm9041515f8f.101.2024.10.28.03.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 03:22:06 -0700 (PDT)
Message-ID: <f18fa492-5d59-4708-95f6-9878fffdf859@redhat.com>
Date: Mon, 28 Oct 2024 11:22:05 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] memcg-v1: remove charge move code
To: Shakeel Butt <shakeel.butt@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Hugh Dickins <hughd@google.com>,
 Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 Meta kernel team <kernel-team@meta.com>, Michal Hocko <mhocko@suse.com>
References: <20241025012304.2473312-1-shakeel.butt@linux.dev>
 <20241025012304.2473312-3-shakeel.butt@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241025012304.2473312-3-shakeel.butt@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> -
> -	pgdat = folio_pgdat(folio);
> -	from_vec = mem_cgroup_lruvec(from, pgdat);
> -	to_vec = mem_cgroup_lruvec(to, pgdat);
> -
> -	folio_memcg_lock(folio);
> -
> -	if (folio_test_anon(folio)) {
> -		if (folio_mapped(folio)) {
> -			__mod_lruvec_state(from_vec, NR_ANON_MAPPED, -nr_pages);
> -			__mod_lruvec_state(to_vec, NR_ANON_MAPPED, nr_pages);

Good, because this code was likely wrong :) (-> partially mapped anon 
folios)


-- 
Cheers,

David / dhildenb


