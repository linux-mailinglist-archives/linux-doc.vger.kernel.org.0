Return-Path: <linux-doc+bounces-91707-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rx2uHmU2KGoJAQMAu9opvQ
	(envelope-from <linux-doc+bounces-91707-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 17:51:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 712A1661FFA
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 17:51:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=VKwEITMm;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91707-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-91707-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D7B773071C51
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 15:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8B6492508;
	Tue,  9 Jun 2026 15:35:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D7C49250F
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 15:35:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019309; cv=none; b=ajzu5LpGNdhxmbMUidcqyfPaLaYM2nkQlhwlBI6zZZ+PDtvuYAAizVdLX+sN4BE8HmSFwZ3HsLqQ/7F2xaU1rgM2azVrn26gMv9Y7PgHtCccrQ4DBB17bKVMG5Ez7uCQ2D3545S+aMvg7yjbx4tAJ3B4L9Xqe+nkGmXWZn8FrIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019309; c=relaxed/simple;
	bh=IqA7ece+KivQIz+QnTfJlr8GYFK3bFrh9+lzAaVoLks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlM8hVezpzO0m258Ke1VLH9bH+nLi65x42fXI/+vl+uX5gcRy/nAUhsd1qvulQ6p8cvAIeJBxS9OkmRfAjuFCqat+O+J+9qIlOYJmt8GgwTyXnrTRAU62MQW4rn196EUxEWv374GQ/1NjrfWcNxcCy9Sb7t1/nCr4VH/ikZyp84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VKwEITMm; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf22c18ad3so538025ad.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781019306; x=1781624106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UyfvIUyYOvTVt/UpRIulwDCiz4s89QiTYmiwF1UuTbs=;
        b=VKwEITMmY+vIF7jLHPm/G3ujxm+/qQAK6QbACHBRHkH8m32SFVruEegpcyXlaCBVqu
         VCjsa/rdPcJp35mI2h6n9tpOuGNWUuaQ672kL87BfJ8fA4XiLfAS8dzGhYCMsiHiMQAQ
         u+kAUtHMKxkaqatkoNqFsJd2xRtBbkpXfUlfDm8dXmz3XNIG7/GWlufKlgCvlVJQWpoj
         jT//BncqBAcfCRJDw4CjgvZ8fILeeTX7hsPJYxq050U22ausROyCbFBo/3kXBtTRKTKb
         gMtpCGmO2VbnxSeFNsp1948l+WUDylvlTrkzF2nmXkyoGoJxP90a3jZkRqTpBHs/ayhw
         x7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019306; x=1781624106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyfvIUyYOvTVt/UpRIulwDCiz4s89QiTYmiwF1UuTbs=;
        b=EMzz9tEo4440Io3/X5n4emoPdE1EJHEKsFhnzusp9wG6wfli991qG9u+WujVkH9r+w
         n7+hBPgUaC+twsHUcrz5TKKJtqv3o7JmouhqUV/4e73JEhTtxZeJz1zptWK1Rm1lIl/U
         oEKJfjyPTlmgPFUNjfeZglri6oSZbjKtKoWA8aAfpzI7TOctN+IqYAMMkHEOQJ2GTnEo
         L1IgJBdj3CWGf0UDFMhxIMHf2tDoo/7/WICT7BOCsN+OkLuiTwmcuSN4P1+QEpz9LkWj
         Ku3+ZslHH3p9DwIoWdcDZpAFbnYyLZMgW0ae5C1HqjBolQ0JxllghezdKnvsD8R1VaUk
         IiOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jaaLuWLZVA0FG0W2OKJzpUWzdtV+b1UWJKWVppCaEd6NIrs8ZmbFT3ZpggGsNsADPXvY9r1xxIJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDe8opru/U176gNx/n8WAaGuXDUiJX2FxIKXz8WU7tjj76pPkU
	rT2CtMScN8639A4JuvZvPVIVsx1ltlDkVSru+UGPAfFNP9MoFeHmbcuWnlct+eENQg==
X-Gm-Gg: Acq92OGTikrxp8aXl3c6p9WixaRp5cIcD1P5vWzVPVfxCea3LvNPOPItsA3lvzA8itv
	8DeanhU5svMKPXMj9kw7IdUB3e2E5IdCgvSVFboPeo0mw7rMXPtbTHGVzeWd3qegtrxb4henLJH
	HDqPZppOYi6qFwjfmQXa7+6jmA+mWLjF800//m6e/wF9O3k/xaaKlbaEH8mEJnsYg9Nd/w1+jHB
	gbIS5TY+X4N6p4E8RUdyLjah4podjFZrSTAW2Oarbspoe8wsUhxJibSDBQeW1inRrMWRv0W3s6S
	cdOpj6KSPclHYsZQPsyWVtyU2Z5U+997qkogz1s4OyKhjJ/zbEJgR/0aOjhWxkMcl+z6MRcrq2q
	OFfDCnzqg35HFl2N/tSi/uqD7ODwRoePDW0fQPgxvk0JRdJHd56EAOyDknzyFIhfXIzzQsRgRwX
	Z0a4Z4lDzenLQYoOTE1AHtMq9GJq08c+McZYyDUk9uYKumDT2xMnSBKBozZeppiDuFGHWZTKX87
	O9og5nsdQ==
X-Received: by 2002:a17:902:e885:b0:2bd:7e8e:ad56 with SMTP id d9443c01a7336-2c1eafba702mr7653595ad.6.1781019305283;
        Tue, 09 Jun 2026 08:35:05 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm24737580a91.1.2026.06.09.08.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:35:04 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:34:55 +0000
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
Message-ID: <aigyn66-xQ_9JBW6@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-9-dmatlack@google.com>
 <aiXWmR-ettxin4LC@google.com>
 <aiaeOVomxQZhoM3K@google.com>
 <20260608181640.GO1962447@nvidia.com>
 <aigtS3UDdhUGp3m0@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aigtS3UDdhUGp3m0@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91707-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 712A1661FFA

On Tue, Jun 09, 2026 at 03:12:11PM +0000, Pranjal Shrivastava wrote:
> On Mon, Jun 08, 2026 at 03:16:40PM -0300, Jason Gunthorpe wrote:
> > On Mon, Jun 08, 2026 at 10:49:29AM +0000, Pranjal Shrivastava wrote:
> > 
> > > My point was that a FW exploit can meddle with the bitfields of the
> > > ACS_CTRL to spoof and mis-report the ACS flags.
> > 
> > Devices can also ignore the ACS flags. I don't think this is an area
> > where we should be worrying about devices being actively hostile.
> 
> I'm wondering what happens if we preserve IOMMU groups across a kexec,
> but a switch's ACS capability is dropped or the ACS_RR bit gets cleared?
> The incoming kernel assumes that it's the same ACS cap from the old one
> 
> Now, the incoming kernel restores the groups assuming they're still 
> isolated, but the hardware no longer enforces it, silently allowing DMAs
> & breaking isolation? 

Again, to clarify, I'm aware that we aren't preserving IOMMU groups,
the incoming kernel has to rebuild the groups. My concern is that if the 
ACS_RR bit is cleared during the kexec window, the produced grouping would
be different than the old kernel. What happens if two devices on the
same bridge were assigned to 2 different VMs?

Thanks,
Praan

