Return-Path: <linux-doc+bounces-38986-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F08A3FFF9
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 20:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E654189FDC4
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 19:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B685E1FBC92;
	Fri, 21 Feb 2025 19:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Ewl2gdGZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0514B252907
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 19:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740167166; cv=none; b=Y2XfIbbAPonSdOGEiOHmbn5MUhQazsPIvUs/awUTf/sV0as9vCK8G6AJK7huIJFwuMoyD17yOAx5QU0yT4oJJLFSIbE3Ox0wmH1y07uW59xZ5eZYGDgW6sYPnye3dJJfJn/kB6AdjOq/EMfEUCLEYd2wbiqR8G2RzGTzHKovQr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740167166; c=relaxed/simple;
	bh=Qe8yglpOVRl08XDC6oKRGtJ6QXAw8XWVocSPl5/Xr4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcL8X/JwadbSidpBm3IHtCKJHGBpW0QEoYB+VPtSLMsIcpgzAsW6DEkPllbv0CEuM7jwFvmlP8mVHq5cl8Sva/KHorIyPNJOArpp29zLEEiuZuy7xq0pbnMH+j+nhUReUv/ggTZBL5vyYd9l7OEgPa8hoz14jgDZamHsiF04U8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Ewl2gdGZ; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-22128b7d587so50284765ad.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 11:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1740167164; x=1740771964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qe8yglpOVRl08XDC6oKRGtJ6QXAw8XWVocSPl5/Xr4g=;
        b=Ewl2gdGZqUnw+1NGxfN9LFXUi/jnRhe6kbiReEtsGi8aUUe97RrDO8ixR8GSL9hEqU
         IkD/jMKWng8UIUEiD46a8jzaNdsMAhxuS90sc9fEli64C0s53Mh631xZOmn9kUlhag+5
         Mc9zdUtG/kDorSNTItki/BIyuJ+8wSvshCjzMgv732qTvWboIzwsYZaUdTNsN5bMGFly
         pQndzMBfmJDRVWTP366HHkf9xC6WNZBEUdIV9QtraPiycEtVGGJJf0nxa+dt3tQwLZAX
         J7+aUWBh+P2+2Bsl0UGAKn+jKVGBSaHsQtwiFqwm2Kp650L35hZgzTZrjVlsF+zVWGeO
         xizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740167164; x=1740771964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe8yglpOVRl08XDC6oKRGtJ6QXAw8XWVocSPl5/Xr4g=;
        b=mtgKWUmWYSPaFs8vpwnV+a8HYStEoEcFc4/qA7lSK3eelSNqEQpjFzZgazQ5iLZfio
         C9Rq893d91jNratQE4QUfDo4IuBvHPV1aOxMTnKMzuny1CxTd4Hiyki46uQ2aVdW+4rx
         zZgubzHR+ze1JOL/G9rWwJwrAXBwddQdyIyQKxlHacqae3CSAMs5PhaYi1xShE9B4wqi
         mVEzHf2MrJs8ToGya3+w6qMDHKS1jiHT4GPWZkhYMQTfCQFE2WYIb6+NMbxO6bWveYkA
         t2tRK5uPnM9qA8KToyVTMPaysitXf1Dq6MvnTqyzcvhDFpZu+2FMjezsOAEIZvAALVh6
         lJFw==
X-Forwarded-Encrypted: i=1; AJvYcCUmC4oPRw4sCCR7L2U69857zmamSqpbxmOZXEPshNMGSR4Smxecx4uFvMM09KgtjvG/Cuv6CCzNf48=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3qjnVydX0egD7yBFyi6+aZLjFI6FvoOTeWTKfGWOm4yTs3Hm
	tAApldaxPqHWgW/DIEQOrW2vGsx0pcfeP7IvHlZf/VRviqXBrcATOQYepTRMYjpPEBHNoOzWDby
	kCuGjC9REbaXdIfLLA/Ghvk+n2SAVWG8n
X-Gm-Gg: ASbGncsnSa6+ZfYsuTEN/e5VYZyscwUDxwYwyWY2wjDSDkDSh4ggVhCr8bQ2IO+HnA6
	Lly7psN801+043Xbw0+BgU7kY/kFh32sK9ECzKfVUm9jA6FPPQeJ3Im94E1R38QSxPIL83iKIcS
	iBEpwZAGktfFfZ1cAo+zIS/JTQLstILawlWbp+ot+mb8xJhK4FHvbwondQt/+AMpgw1Ee3sl1kf
	oiN2xVHRyI6pI3FHf09bhP2jxW0jW7Td0W3hJr3D+7KWkt5dsmiqsU0BfYuYu1uoKYwhqsOsZ2W
	3xZoR3eihXKqaeeeXIm3dhynQDawEKreHmqqsBhDJqjWkJP4ig==
X-Google-Smtp-Source: AGHT+IE99U6jlftn3nPn0N6zw6A91ELHQp6V/gmyF5loNHs5o/JogzFMPNpAfsJgR8a+p2Gm7+cQJsAVNGtn
X-Received: by 2002:a17:902:8686:b0:220:ff3f:6ccb with SMTP id d9443c01a7336-2219ffd3251mr58361775ad.42.1740167164247;
        Fri, 21 Feb 2025 11:46:04 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-220d5431e51sm9073475ad.116.2025.02.21.11.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:46:04 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 6B312340216;
	Fri, 21 Feb 2025 12:46:03 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 60ECCE56BF4; Fri, 21 Feb 2025 12:46:03 -0700 (MST)
Date: Fri, 21 Feb 2025 12:46:03 -0700
From: Uday Shankar <ushankar@purestorage.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Simon Horman <horms@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Subject: Re: [PATCH net-next v5 1/2] net, treewide: define and use
 MAC_ADDR_STR_LEN
Message-ID: <Z7jX+z/Ucq5iu5bS@dev-ushankar.dev.purestorage.com>
References: <20250220-netconsole-v5-0-4aeafa71debf@purestorage.com>
 <20250220-netconsole-v5-1-4aeafa71debf@purestorage.com>
 <20250221131750.0630c720@pumpkin>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221131750.0630c720@pumpkin>

On Fri, Feb 21, 2025 at 01:17:50PM +0000, David Laight wrote:
> The fact that you have to keep adding 1 or 2 is a good indication that
> it really isn't a good idea.

Having to adjust by 1 when converting between string lengths and buffer
sizes is super standard in C since strings are NUL-terminated. There are
tons of preexisting examples in the tree.

I agree that the + 2 is a bit of an eyesore but its needed in that case
because that code wants to tack on a newline in addition to a
NUL-terminator. Maybe adding a comment there would help?

In any case, MAC_ADDR_STR_LEN is a much more descriptive name for what
all the changed code is actually doing compared against 3 * ETH_ALEN -
1.


