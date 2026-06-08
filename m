Return-Path: <linux-doc+bounces-91360-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w5a5F3CvJmqhbAIAu9opvQ
	(envelope-from <linux-doc+bounces-91360-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 14:02:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5441E655EFF
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 14:02:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=brlsmJ+R;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91360-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91360-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A6AD3009F2A
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 12:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39ED637187C;
	Mon,  8 Jun 2026 12:02:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD0F348866
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 12:02:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920128; cv=none; b=emYydVuLib4JDpl7wNS+tMzd+piaPy5Knv0KD+84dB7MWzvatIEQjtjjwL04MqmASsCZYMTud4g+HUdbbd/En/PmX9iKqOHKjQepqGWTyZKz6n90CR62ZcASYGA9/WRgFpD+OWDjhFMnhHhZqPEm/yfkSqSH9OMA2N5uCygwAgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920128; c=relaxed/simple;
	bh=5h565UQOW9a2IJHasBszuWYVo0+DZmzIhsjI+wT8Ku0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4aLpFQbZr+65kXTyIBXtRBvOURldDMGflWt5SRnz4Tbh6MDOMDnIJlRDbAPn/Bxw1Hyt51Dw/d7XjH6yQmMSt/yu2MtDeyE3UntepiN/HUFjwI6EexqwCDFNRyjDjK3tgaEVMoTN01Mbxc2zKumHl23C3nN/BIwXgNGfHX+Pso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=brlsmJ+R; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf22c18ad3so374205ad.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 05:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780920126; x=1781524926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tJaMwlHdD5ukSuw9Ddmz9W921lhUeR/xfWp0HtFNkEA=;
        b=brlsmJ+Ruh5zlmyZfJ2JLvhLAsoJ22cOQzIzuhos+aSu4YzmcIDO2+BQWGW6VWA/wh
         uH5C//BLz7m6ENna1PzhFSx6+eu8TbobCmBHdPje3sJLCJNxkCvQDHbVIJftBvOafA+X
         qfuzPPuH7WLsSn7riShKgzcc6T+KqpZmc55eUKrCXlXzB4KhlRj7evb09iOnI6zy0uxU
         V6IlvZUBUcbO2IuMYYq4PQE85rZbwZsth1FlfxUbbWk56WDSuT0hKnqkpHJGh3DQ5RM8
         EyuL/kpwXI+xfSSkrcXDgR7f3SdcXEkQpxU35eyGpnKc/jLt/0+1JYrOwqm1tFHZyJXE
         TbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920126; x=1781524926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJaMwlHdD5ukSuw9Ddmz9W921lhUeR/xfWp0HtFNkEA=;
        b=M+gabFe0SU3TdAiTmR+47oBKCVqwbxgNDusr7rIFBwngzxsiS6neTMPfb6BCewfxqv
         jM2Ph3mfQoHGCDbgNIt44q+7tOqaukN1W3E04ibY4ACrcM9kRlV2iII6oOrnL6tIIdsv
         b3KesYO+PtVhQ0XNe2WlPwK7iDRggJNLVeTsdtQLEvzHio0hsOw7K2HNgsTQy27KUz/r
         k9uqqA2D6g2STPQySo3dQb7sUTv9hnyn+ZdG86nv953Q63DtulP8NNdDtxUPxLeuWode
         Nl5/N2OvLeJmOLdy/OSA/IlfghPZ+dy1duagG08YGSWsv3TJqJMh+wMP9ml2Ie0dwb0B
         XL2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+sCYRNdXghdIQ11gN0EtilmL0xZHg2lw8FHi+wD7p9AZ2vDNDr7hBbV/fn3bp+D73XzpDj/FzDj+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzppldUNxWBVPew9x0mucOZYRHoufMlGXZ40qONcaDyjAzSyhCv
	xtXsysaGfhI3MlFHi1/y9nrXQglkNm/K0Ecz+ZnLv4oNnW3tPUN2fIEFQM0JzPpQiw==
X-Gm-Gg: Acq92OH4R1RgH5AGgJ0Y8UdPtoNWBKvj4pp0TJujQtN59kxY1FJ9plML+EepcFb8ura
	yeFUlkhkJ1RhZ0OUst7i8IUGfrGXkRedXjY12YPCNhM1LCQli/ufpFef4lcgMGYtWIM7rL4BcRA
	WRJWeNI88tAcfnKljmYGZTcnN3akFpHe9Ly9v79mq9hY5BuSp9Jp7xcQ4kAzmnTvgrAypqViO+3
	vx8HyvN79xQxw9Eo8o00yUCzHMN+fSnjwMkjHuIw8eQNPfeevngbsZ7Gg4Oi4UdR3GScYRhljUM
	g0UdbeFNFUL3MTJmVMfLFehlSxeDNnirdLCLRtkoF9cCwV2xphw2co7/EfMb45Z8eYFGh0RqQtk
	zf6hsB4+IFVKIO6TdQlXJV+p0PvqhlCOmZ0dkyCo3rbR8qaKs8kinC4DrvLm74AeBpQybPU2xzo
	B3gmlCEe3ifLbS5VncLXMqMnZMur/QawvJbNUuvCfoMGqREZjcRKzCxenLWxgYXkH8XW4U8jqnP
	D21kQTtCg==
X-Received: by 2002:a17:903:ac6:b0:2b0:aee4:afe7 with SMTP id d9443c01a7336-2c1eb1dbf25mr5272565ad.10.1780920124143;
        Mon, 08 Jun 2026 05:02:04 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f85de1sm180971895ad.20.2026.06.08.05.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:02:03 -0700 (PDT)
Date: Mon, 8 Jun 2026 12:01:55 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 12/12] Documentation: PCI: Add documentation for Live
 Update
Message-ID: <aiavM2JWPds-mEfD@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-13-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522202410.3104264-13-dmatlack@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91360-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmatlack@google.com,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:rppt@kernel.org,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhawaja@google.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[praan@google.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5441E655EFF

On Fri, May 22, 2026 at 08:24:10PM +0000, David Matlack wrote:
> Add documentation files for the PCI subsystem's participation in Live
> Update.
> 
> These documentation files are generated from the kernel-doc comments
> in the PCI Live Update source code. They describe the File-Lifecycle
> Bound (FLB) API, the device tracking API, and the specific policies
> applied to preserved devices (such as bus number inheritance and bus
> mastering preservation).
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  Documentation/PCI/index.rst           |  1 +
>  Documentation/PCI/liveupdate.rst      | 29 +++++++++++++++++++++++++++
>  Documentation/core-api/liveupdate.rst |  1 +
>  MAINTAINERS                           |  1 +
>  4 files changed, 32 insertions(+)

The kernel-doc directives seem to be wired up properly, along with 
formatting/indentation while keeping MAINTAINERS in sync in the same go.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

