Return-Path: <linux-doc+bounces-91675-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZvQdGuovKGor/wIAu9opvQ
	(envelope-from <linux-doc+bounces-91675-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 17:23:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D78661B1B
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 17:23:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=B48lUTGb;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91675-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91675-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B26C0301DBB3
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 15:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D055537B011;
	Tue,  9 Jun 2026 15:12:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A7734D3B2
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 15:12:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017959; cv=none; b=K5W7Ivykd3MZHOw5nQkdLpD2pzK9LuV15PNwuGGuhkQsMmLwv6D82nlqTwqowjaNHMV8G4A8fOsW1c0DfDREcQc88kYmXA8EId07PlHcZD5on0KwCgvAxf82S7AKLlWm9XqGsQAKAV/YfAACjbohYG5DaZaMk4PC8SdBcwqrY18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017959; c=relaxed/simple;
	bh=MOv3SenVOIJ+2PjxGXILrvwas4FLe9X40rnIUrUcvII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kc3hGSQsHGGcVubv/XqMnalZnEpOowH0QQBBj7mpbEpkHQT3lV2pb7o+NieR670U4wjb+0mXdhtFBq4b0WMDFXSxYySBIxLYJOADem3mF6wcTMUBAbNI2m/6d8HFWCWffIG6z+gk5fADe+T8gXpNcOJiMawqWg7px13gRuVAI10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B48lUTGb; arc=none smtp.client-ip=209.85.160.174
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5177d1ff061so2328711cf.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781017951; x=1781622751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6VKUC1VUaetCGs5JJDLFKtb8dO63YSohjJ7JwyYLsY=;
        b=B48lUTGbF/PPdNoQgIo/7L/EmIEbRpJUb5JyswQLrZrpjkTkSAOTzDqjo7n4tW0ftT
         RwOpRT5rCK16aEuS3rmINv4X/zQzQG34Ra+qfBI2QoOPuU0JRUjj1pjuwNK4RuJHjpzw
         YXKsiIMzIO+n5Sz5J+IWOnH3RtAiWYCQLpgzDA6c+zvQXhRqFT9+nTk1GG3yEZyUaAKC
         GddaFp/hMHUzu8atXszbAbEQ3QT1Ek6kZ0ySGW8K0cdqDBgNarcj6fYhkaCLBfezIPOL
         1X+o6iYPd9kZhvQOoxzPPBbp0mjOOMxHnkaeAin8V5Z1jDtBC5z+BSmLvc5hGVx5Wucs
         Tgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017951; x=1781622751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6VKUC1VUaetCGs5JJDLFKtb8dO63YSohjJ7JwyYLsY=;
        b=fMMabFnYsYmyOBXMY3KFl6bnIhwwCFGLg47RmGR3Zarx1PhlIQB2BoCx32U1AyEIEi
         QPrHMCFC0RylsBPiE+ncuKXmpbQu5+SPaaye34N9Zcm8lGJEzUZaa6DJ4T1evefy0rxz
         qyLJxyhkGTECGMKdaRLqn5ufKOhk6Yr/41SF/JuYO4OPNpcT02Wtmv1TZWHDSeWH5REp
         wNj3Q5uek9HhUqxCr4T25MZOMuddM57hm19m9sQpxNmcUKDMgzA/I4iSrHYuofq/DVqU
         QFYpx/D1JdYbP8hoNdKDYVFoiUbluDruqTCqQmsPJzxqnTe2JoT/B+nRrCb8a2S0pyq6
         65Dw==
X-Forwarded-Encrypted: i=1; AFNElJ9Df4AezqZSo5NrhKP7hBrJWDJNP1FdGDj/cwoy1QkFOThN251i55AGV+Md+Xn7NgeF5V+M1vAuPL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBeMkgSoB4fksovGmt1OUHgZ96CBy8Cft7B2mSjabiTGpK7PBs
	AcbFH4dR67HEXStaTJUNIgtK/PJT4KkKy47Q6LPsSw1fSqzoDrgoRCjuG0De0cEdUqPol6RVnYn
	52xGZM7wq
X-Gm-Gg: Acq92OHTsY7ERy6y7XBAA8KoktDzHqCUtR3Qa2jrpE2tOVpKVmgvmqxdsJuCjsiw9ZL
	YA5gzdVGtPC5hn4qtBc828oRH8EF+VfrBqVXIiCrPQlHntRZugoVTMieJPoj/OTw1zfeBBcpCfK
	QRE2pOPtwnQx+z2oKsdGcxdX5cY+yl6HlN4C//Ac7A0PnGAxyKHCLGM6XETGKAnfsyoghOkXT4p
	SyWxbK8cTJTn8TylMosCMKAeDNXlEa4unKikXUMet/itW4f9iMB6B6ly5JC+gBzV5HpQKk/tkY5
	gc1PM3CKFccxI1V9tv7CT+4ADz+aUoWxptWWzp5jWw9K7ZziUvLziKeBWr8R9W6Y9BGOgTf089B
	dG2QunJAs1Pucm3vJSanOQa0uJ1A/AkhnAYLlA2IShFiRcNTD6TRj0/6Eo8r0Z4RtCv7tExtiyL
	cnmifUzTdvgIhoKCxGcAbw5YXe47iYgv13ezA+ULdFcoX8qYvLwdvtBKQkSwsaYini7xkC4Mg=
X-Received: by 2002:a17:903:19ed:b0:2bf:3579:cdaa with SMTP id d9443c01a7336-2c1eb942782mr7408845ad.10.1781017940616;
        Tue, 09 Jun 2026 08:12:20 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d40asm208599735ad.64.2026.06.09.08.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:12:20 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:12:11 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 08/12] PCI: liveupdate: Inherit ACS flags in incoming
 preserved devices
Message-ID: <aigtS3UDdhUGp3m0@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-9-dmatlack@google.com>
 <aiXWmR-ettxin4LC@google.com>
 <aiaeOVomxQZhoM3K@google.com>
 <20260608181640.GO1962447@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608181640.GO1962447@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91675-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:dmatlack@google.com,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:rppt@kernel.org,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhawaja@google.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[praan@google.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08D78661B1B

On Mon, Jun 08, 2026 at 03:16:40PM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 08, 2026 at 10:49:29AM +0000, Pranjal Shrivastava wrote:
> 
> > My point was that a FW exploit can meddle with the bitfields of the
> > ACS_CTRL to spoof and mis-report the ACS flags.
> 
> Devices can also ignore the ACS flags. I don't think this is an area
> where we should be worrying about devices being actively hostile.

I'm wondering what happens if we preserve IOMMU groups across a kexec,
but a switch's ACS capability is dropped or the ACS_RR bit gets cleared?
The incoming kernel assumes that it's the same ACS cap from the old one

Now, the incoming kernel restores the groups assuming they're still 
isolated, but the hardware no longer enforces it, silently allowing DMAs
& breaking isolation? 

Thanks,
Praan

