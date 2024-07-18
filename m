Return-Path: <linux-doc+bounces-20996-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F55A9348B5
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jul 2024 09:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39B011C2176C
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jul 2024 07:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D7A768E7;
	Thu, 18 Jul 2024 07:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Bx7jI98m"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE78768EE
	for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 07:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721287305; cv=none; b=dseinJHFJBfJs12i1ad2KF0bW4LZsDltqVI8buPFaJ5cfquE8C/4n1ikUkyEQ+8PmikZ3r0vZPivcfwJEp3auyRblYYRPW9PpdzSHN+aaNVOQlDcLqk1zXkOGp9Gmv6AzwGEFlPpIewCYte/lL/j1H9pUew5PmUBC+t54dIII6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721287305; c=relaxed/simple;
	bh=QVa3X98w8qyr8FW0n7dAND2AxvsnqzpDtMSU7c9ZPvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlGQoar6IkIY1PfYv2niMfUNb7uohFjzFWBWBNOO49vyYyQoeOHaF96J242vBQd/O0GPJ2xRAN90gws9Vlp4ofxNVpV5TvT+2Snz8GYAwPt+0kXKf0A97DbNiK6SWbmXpEOZHoIUBS+P4inzwfxsvT7QVz7YCX9g7Rosxxc8Kjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Bx7jI98m; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-58f9874aeb4so485251a12.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 00:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721287302; x=1721892102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z36h3EgWdW0oeGo8MwGOQHC0vdVkypcTjZjQ6VZXxVU=;
        b=Bx7jI98m2uAugcAu/DA4b2jO+dWPh7Xsk/BNOnTaz8v7Swj20+Vf+XSsLu2Qqu1an3
         Xpad0rqUtJ5WBN3FdpVz7ofIW+x3XmZYNWFmPfij4rnVAyu3LCmMvFjFnX7KHncEbBXL
         2NbpTsTZTNkQFyoxlvkN539FDzBwfJVfJgMwb7teoetnsVRvWp069jgFlVLZHkRgnxIa
         Lz6VHpD0aof0+rWMNIOOdipFi9yiM0Wd4LJG24DjkmUTSNGvuqDo5CvJ3ToVvBv+18Re
         NwaHaY7/mZowuRaOmJ/AlrLvQCmji0U08pNpTIGuMOiEDHSqoU07z7Lk2eV+Ur/JHYvT
         P4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721287302; x=1721892102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z36h3EgWdW0oeGo8MwGOQHC0vdVkypcTjZjQ6VZXxVU=;
        b=T2ogzIfm9+TvO+HGdxlbLiCmq8kGBaOo2lkLKlAh8gd8rkArpGsKXv4i3kHLFb7er9
         TQsxdnVX3TAh2vzIpUszbmeWHHrTOWDSMTUYkvRSsgTdvywGap45bNR0LmAZzlrslH1c
         8+KMVA0q1NtGULzJp+W8qLIDJRcS0FsTJxVHr3IxaTyYEvCn6+pdYpw9qQ5WU6SYAgkT
         XPRTQDDvXdDIZu2FF4nhSCr746j0+ae7gJoG+RZd7PbiFdQbynojvF8bp7g92A4xWoNr
         HhcuKagX8dKv3zyoBA+RBuf+7GPXZKLR7D7Vk+l5jnF23goxH8Tf/JMis/1HSJzyIveX
         MATg==
X-Forwarded-Encrypted: i=1; AJvYcCV/fJHjiohM8/ESfVK41H1MH+O0H4xQuFrqzxo3uqD4S/Fr4m6N8Jkl8BScZQVweW6Dv5SK35es9wsq4iPbGphFhYszvHegq1m2
X-Gm-Message-State: AOJu0YzVvnU+f4/9N0noxx54frtrxDuNP2gskzdW0G2IYWFs+g1Uncmr
	rKaECmxRcgupJWmTCq6+TIqdb9CDkgmQRIQ6eL/2jV3Z6Nzp7vmjBOz/FBKmJ3I=
X-Google-Smtp-Source: AGHT+IF97x7bn4mYrwvYkME2x6ecrHUwJBDJGcc/b2qRODahL6q5Up4jRxMNik+dgw6dPDV5AHUrtA==
X-Received: by 2002:a17:907:76f0:b0:a77:f5ca:f847 with SMTP id a640c23a62f3a-a7a011199famr260206966b.3.1721287301660;
        Thu, 18 Jul 2024 00:21:41 -0700 (PDT)
Received: from localhost (109-81-94-157.rct.o2.cz. [109.81.94.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc820e3dsm528650066b.194.2024.07.18.00.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 00:21:41 -0700 (PDT)
Date: Thu, 18 Jul 2024 09:21:40 +0200
From: Michal Hocko <mhocko@suse.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: David Finkel <davidf@vimeo.com>, Tejun Heo <tj@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, core-services@vimeo.com,
	Jonathan Corbet <corbet@lwn.net>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shuah Khan <shuah@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
Message-ID: <ZpjChBcIFUFulH91@tiehlicka>
References: <20240715203625.1462309-1-davidf@vimeo.com>
 <20240715203625.1462309-2-davidf@vimeo.com>
 <ZpZ6IZL482XZT1fU@tiehlicka>
 <ZpajW9BKCFcCCTr-@slm.duckdns.org>
 <20240717170408.GC1321673@cmpxchg.org>
 <CAFUnj5OA0KaC54M9vd8W+NZJwz5Jw25u-BStO=Bi2An=98Ruwg@mail.gmail.com>
 <20240717204453.GD1321673@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717204453.GD1321673@cmpxchg.org>

On Wed 17-07-24 16:44:53, Johannes Weiner wrote:
[...]
> The problem is that once global resetting is allowed, it makes the
> number reported in memory.peak unreliable for everyone. You just don't
> know, and can't tell, if somebody wrote to it recently. It's not too
> much of a leap to say this breaks the existing interface contract.

I do not remember any bug reports from v1 where there was a max usage
misreported because of uncoordinated value reseting. So while you are
right that this is theoretically possible I am not convinced this is a
real problem in practice.

On the other hand it seems there is a wider agreement this shouldn't be
added to v2 and I do respect that.
 
> You have to decide whether the above is worth implementing. But my
> take is that the downsides of the simpler solution outweigh its
> benefits.

While this seems quite elegant I am not convinced this is really worth
the additional code for a metric like peak memory consumption which is a
very limited metric in a presence of memory reclaim.

Thanks!
-- 
Michal Hocko
SUSE Labs

