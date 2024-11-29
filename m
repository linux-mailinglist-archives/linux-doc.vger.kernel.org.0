Return-Path: <linux-doc+bounces-31690-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD9B9DB63C
	for <lists+linux-doc@lfdr.de>; Thu, 28 Nov 2024 12:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F809B26065
	for <lists+linux-doc@lfdr.de>; Thu, 28 Nov 2024 11:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EC31940A2;
	Thu, 28 Nov 2024 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q6GhhOoj"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C9C1925B3
	for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2024 11:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732792065; cv=none; b=o7KbsUvlu1avwWYg22R/jV7pb/9A1LgbeDnaoyinazs5xx0w0OCQ/JpCF6If6elxqsYeIgyr6ef00oEMXmBUN4iMvSgLwngPbYwbcLzJn/5TL+4O9XyBJub1ydsOeZEqX4/3nLwZSoQBwxINDsfEjHAnx9qlkkiw3T9M7G0fWwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732792065; c=relaxed/simple;
	bh=dtEbl+eAxjNtqIHD/lA/11e457LY7bQDSZJVQdho3vc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UQEQw2zacLvWFkbcANN5S6EUt3oujn2hh25Rt6XJ920CZJUlqEKITLWQIz+FyUm/JGfSS0oE1xU2KJ1o/tIMP/hj4+m4P/WyMBih9mT73Gh2wDvHX8dVdc9w5EigLYwOrTQkqOH0JHa1KclxC1gbmn9nmkaqdXLJn4Po5qEfPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q6GhhOoj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732792062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YLK0mLTOGgTQPMKHKX0ABr1QZ2jKPpEqJQKsnJzJ90=;
	b=Q6GhhOojHt37Ha8CIwT7qIGJ9Wegin62EiM2KL4MsUUNON2G1LAQOQlVwTJXtq9I5gRciW
	rbnfkhlEC2PMNi+SKBfyQqN+tG9/1XxfPh7gjY4EQUFeqWwS+yWZY6DKVANLnI05ei5nYx
	BNyeQiO+25COEGzuwzb+diJEkMahpME=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-4341XJPuOOawXrNrEIXVTQ-1; Thu, 28 Nov 2024 06:07:41 -0500
X-MC-Unique: 4341XJPuOOawXrNrEIXVTQ-1
X-Mimecast-MFC-AGG-ID: 4341XJPuOOawXrNrEIXVTQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38249bf9e82so350530f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2024 03:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732792060; x=1733396860;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YLK0mLTOGgTQPMKHKX0ABr1QZ2jKPpEqJQKsnJzJ90=;
        b=jJwA3RMYukfnKXrDvQBbIJ7rGiUilGpKglpHDeczHL5kzXEjtjoPrK8B2vTxh6cD8p
         y5DToBi+9IHTUtsxmDMXO+P131M+D5IzQM9bEWBjJUtqj2j20WYNf7a0shOONbigFhnh
         6o/qg/OvyamcRV3ro555k3aa6ThRl4nECLbQYUg0YKiAr8q+d4vvIWDwlS5vTCBrPxjS
         HeRRJaRaNuduaJOOcfj9Q68o6Tl2peqG0mgIkGsGK7XCU4T6oBd50wPT6z1NP9p/q0ua
         JBbaw32pg64nWNJbBhFvfP0wr0U6SmQ/5p3ouUi8JnFcMedFyUhpPPqVjkT7yJF9RPKK
         k7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOKaB04JqlRC6RhmOAWuWF+XlXGrhgHGw6spP3xGTCVJBHv96ifhq9H/aXGfH2/rFMyIBWaxTjp9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn1LI7h4BRRAEmbOAFBoDFzIGNVoA2uf29qenuo3RVv/tvIhjA
	kH2xIP2o9tmhv+/0KZgGgs0peDFbo94Er5VvmOTz9iBw5NJhBe5kv+J9+QqT6X4YH+gZnRT/P86
	aJ3vo1x0JoWaxvRVow4gyOnzEUs7+a5FEd7Tyo7hKutbAXytnb+MAinTDRg==
X-Gm-Gg: ASbGncs5gj/rPCLSzO0IvYS71kTzXTancmKsyZhrwg5dbbdoUkYCzho+m/GGu6pTPeA
	XFlxU/pI5/wN42gXNb5e1cOSmEpRqwr3C02EFp8s7gyQCFdV9lA6XeSBlE79LEfJjjHp0bhzsQK
	2DEYalFK7DBDtLOMWUrGRvIYZ9QP/vRnXc8ZWDdaoJ9KsXAvb64EkwO0qdpP8kwFcH8MueEG1rU
	Id0yHbu1QOEdge8UKI3ec7KPY8ndLvE0nkxvjabc3tpdfzHGB2ypgdDdtmcKjms9Jllz5h/cD91
X-Received: by 2002:a5d:6d0b:0:b0:382:450c:25ee with SMTP id ffacd0b85a97d-385c6ed74c9mr5453031f8f.40.1732792059858;
        Thu, 28 Nov 2024 03:07:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeEhbHAnt7UDcnIN9QSU5mCAPewp86pSwIsK84xm7VJfZBGKBADTHurkaCfScNk20JP2YEcQ==
X-Received: by 2002:a5d:6d0b:0:b0:382:450c:25ee with SMTP id ffacd0b85a97d-385c6ed74c9mr5453014f8f.40.1732792059503;
        Thu, 28 Nov 2024 03:07:39 -0800 (PST)
Received: from [192.168.88.24] (146-241-35-20.dyn.eolo.it. [146.241.35.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2dba8sm1393832f8f.1.2024.11.28.03.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 03:07:39 -0800 (PST)
Message-ID: <d327579b-45de-478c-963d-fb3b093c2acb@redhat.com>
Date: Thu, 28 Nov 2024 12:07:37 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fix spelling mistake
From: Paolo Abeni <pabeni@redhat.com>
To: Vyshnav Ajith <puthen1977@gmail.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org, corbet@lwn.net
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241121221852.10754-1-puthen1977@gmail.com>
 <fc0bb8a7-8c6e-49db-83ba-f56616ebc580@redhat.com>
Content-Language: en-US
In-Reply-To: <fc0bb8a7-8c6e-49db-83ba-f56616ebc580@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/28/24 09:08, Paolo Abeni wrote:
> On 11/21/24 23:18, Vyshnav Ajith wrote:
>> Changed from reequires to require. A minute typo.
>>
>> Signed-off-by: Vyshnav Ajith <puthen1977@gmail.com>
> 
> ## Form letter - net-next-closed
> 
> The merge window for v6.13 has begun and net-next is closed for new drivers,
> features, code refactoring and optimizations. We are currently accepting
> bug fixes only.
> 
> Please repost when net-next reopens after Dec 2nd.
> 
> RFC patches sent for review only are welcome at any time.
> 
> See:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

Uhm... let me reconsider the above statement. This could land in the
'net' tree as well. I'm applying it right now.

Thanks,

Paolo


