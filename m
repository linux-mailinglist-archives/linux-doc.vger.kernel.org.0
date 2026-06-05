Return-Path: <linux-doc+bounces-91038-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Axb0JddpImp0WwEAu9opvQ
	(envelope-from <linux-doc+bounces-91038-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 08:16:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA16264571A
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 08:16:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=ac8UwFJC;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91038-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91038-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 912C130976D0
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 06:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBE73988E0;
	Fri,  5 Jun 2026 06:11:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1393CE4B5
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 06:11:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639891; cv=none; b=YY0bVYh/UUMmDarVWmMNR+RBBnmegTV8fylV7r7t8sCe567rbbLURPS2YULRmUz8itgLooGJzvPL9wHS75e9EiDcUxjdNEOgnhTeV89sq10kzH32M6oZ9e4XSXX8nw0fhtpXHYAMgUeRYOC4sxKF+MyZGPofAKn/NPhrcKHP4Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639891; c=relaxed/simple;
	bh=bDPSYW4sbBXupjVGuQ9fNmCdsAtmh74koaGYMZY927s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHoBPyRbcPJPoz1EJ5O/l6Uga+BwX41z5k6Rbd4Wz4G+Scbni8+kMf7nxu+O8RI+1l+CrTF8QpLi0u5xz3D29u10szJ2N1VTcXbSyDPE9C2/21KBZuetc/MTdgTbX0ktE/svL2BFdJe/cJhcX0+AsZK2QmCi1Bl7KhK+IGXl31Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ac8UwFJC; arc=none smtp.client-ip=74.125.82.43
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-133362c30cfso9159c88.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 23:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780639890; x=1781244690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+JACYJJsZuvAWWpivo6XAMCeidn10mj5aCjcUHoRua0=;
        b=ac8UwFJCMdi8cGmFT7lTPe2kToZwck/hosTgZ+nKsa2tc3jel7u2SOWhFUd13Vu1Gz
         1Wx5PK7EpnoGe0kgKQjmZx+yX9Z+MEHvvZqIAboO4H7HnLpSqgRM8QHIt9BoFK4apFck
         /QvePhnw8yE2v01+0MWo56rAT57153ut56VKfl61YS9fIJoS56EY4BQeRIYxaZr/mZN1
         SqzbaWHnME3f0V8LtomNdkd4EsflEW0F28b7ZFsn/uH8IVXXDPM+o8qdcXQ5GM/jAIDV
         aCcdMAJ/IoiB8vRivJ71j1+QlZQPCyC/0u92BfVhNKefBYk6+CgwIR5wabnWBalm6D22
         jsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780639890; x=1781244690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JACYJJsZuvAWWpivo6XAMCeidn10mj5aCjcUHoRua0=;
        b=qwaeHtcuzWfWJ5C1sCt+B6Iq8aECWggvaRYXPJjVlqR3fs3gMm87Od02B9BUgqHJRN
         Dl0wJ1a+dlawd9+EnsA4Z/plMFqCE0frn6+9DhE4feGNSkQRQTzlb/k42nax3RYcFRI3
         914wQ7tv6/MFeEmS7+6IxoGiuC1GF6Pl4DLELmqowqLujpLrGpoIXai6lYYXEY2zimSI
         ZsWkr4Ea/C94CJpGSu8oiXanmjVwUoNJPn3hwBIQ+UAdUsv2Hw7CiidFrL8JMzKhKLY0
         axW/54wrdnwfCH0tSwZjbEQcBMcBwY8LPtZyKHjUCs6NC3wYaaT1GxSh4Y+kPQODLbHL
         Wekw==
X-Forwarded-Encrypted: i=1; AFNElJ9DKBIjQqmg1dBLQlw+Xxxn6vbGKveL+1Sk6weyvt1QVcR9U6/szYQIqhxXTSNooIXcluMgh7JbJ4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAgQVHTgp+QaILYnvvxODVnysa4T/GaMjhy71cCYAJ3aMY2P4m
	wso2FI6fvwnnDLhrqhqTyl0qYts+t7VhwcR5xLaGLUIr5K7dZW+ozWtgrIZSw6yQvQ==
X-Gm-Gg: Acq92OGoTYU9B96uvjTqwsGnubFJ0C1OH65dPOxsbDrMRj9E6oUygPMqSuL+UCJppqB
	7wo2RI/7ybfRaRwNfUq+FwwuA44FJG8SClb50RtelOs0eEizIjQnggAdGubFgMucCtzfYLD7SKE
	9m9pIn+sURhrqe77LtHwHclDF8mVxy3TJs3YYW9k+Q5zrBVWuLCAyR9Umt9ftebjfRGl6uxiBHg
	+GvXOZ2ldg/R7ImDp+lNXJ2RT+1R4zq7H3xZMBikoosVgYxqzPHJ6Apxac8FwmwW+3V5CvR9hsN
	gMcM9eRSKhIUrbpiSME7xiTkMwhG+vofOf4g6D1c8xmwZu9klgYOr9acViYEPUvr9m0f5gxyN93
	pjjPW/xo1t1iThA9X+TC2FPx49pO20cx81sS2uwUkBSY9d/9DyIXK+g0A9/7R0QZEanf72VvyI1
	2ppDVjJjVNpxhJQM/pAgG5pxBL57mt17XvW+CyE2tpfVndeiib00Y+vUCirysREndf7i6XdDA=
X-Received: by 2002:a05:7022:6289:b0:134:a710:ca44 with SMTP id a92af1059eb24-13807ccb5f0mr74668c88.18.1780639888034;
        Thu, 04 Jun 2026 23:11:28 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074d9fde90sm10632107eec.0.2026.06.04.23.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:11:27 -0700 (PDT)
Date: Fri, 5 Jun 2026 06:11:18 +0000
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
Subject: Re: [PATCH v6 02/12] PCI: liveupdate: Track outgoing preserved PCI
 devices
Message-ID: <aiJohr2dD6Jf8m3r@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-3-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522202410.3104264-3-dmatlack@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91038-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA16264571A

On Fri, May 22, 2026 at 08:24:00PM +0000, David Matlack wrote:
> Add APIs to allow drivers to notify the PCI core of which devices are
> being preserved across a Live Update for the next kernel, i.e.
> "outgoing" devices.
> 
> Drivers must notify the PCI core when devices are preserved so that the
> PCI core can update its FLB data (struct pci_ser) and track the list of
> outgoing devices. pci_liveupdate_preserve() notifies the PCI core that a
> device must be preserved across Live Update. pci_liveupdate_unpreserve()
> reverses this (cancels the preservation of the device).
> 
> This tracking ensures the PCI core is fully aware of which devices may
> need special handling during shutdown and kexec, and so that it can be
> handed off to the next kernel.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

[...]

>  
>  /**
>   * struct pci_dev_ser - Serialized state about a single PCI device.
>   *
>   * @domain: The device's PCI domain number (segment).
>   * @bdf: The device's PCI bus, device, and function number.
> - * @padding: Padding to naturally align struct pci_dev_ser.
> + * @refcount: Reference count used by the PCI core to keep track of whether it
> + *            is done using a device's struct pci_dev_ser. The value of the
> + *            refcount is equal to 1 when the struct pci_dev_ser is in use, and
> + *            0 otherwise.

Note to fellow reviewers: This may seem like a bool instead of refcount,
but this is changed in Patch 6. 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

