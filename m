Return-Path: <linux-doc+bounces-92773-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c5RCLaP0M2r5JgYAu9opvQ
	(envelope-from <linux-doc+bounces-92773-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 15:37:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFDC6A09F9
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 15:37:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=QiIlpuTs;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92773-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92773-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D60F30741EE
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 13:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D43B2D9797;
	Thu, 18 Jun 2026 13:31:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2072D7DC8
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 13:31:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789464; cv=none; b=WePnNpQMNzVBNeCyRGncD8nL9uwe+YRSTaEFf8YMU3D9WPdKQXAVDjf4FC4p0S5p7fKb+38NfC1uLWapsdSLSmB1nJDp5PZiNh0ZbX1CcS3wQb4O5Bec1Tcky39fkG0WAcfE3moRmSGuG9yhtkgVuniEH5vpmu409JTOdMFIgGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789464; c=relaxed/simple;
	bh=mINgEl1nfdkXDN35kp4+T/0Nzijj7NUFhNLLfQaVv58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z80wNA3dIQSGAWP1TXQbPosZgCfLab3Zh3z6oDfvLAgWOIibk7Z7guPso522w5Wm3BbM7qAtPp+DstF3Bwnsogd31fLpwST3Xlh1zEUbY9B/4B/kGEOhTqRd3xGy+wayvZDesIT4sIq1vEx7JJ6sEVevzPTOtQQ++/9B4VhJuHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QiIlpuTs; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c6b7bd4e8dso51185ad.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781789463; x=1782394263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=97YgfxmG6Chl0Ir+S9QMmQ5bxu5X/S2hJhh/DZ4TYTw=;
        b=QiIlpuTsxe+D9eEYFvvH9Nj/F3axxlISxlLa7dhU5tnG4KHNwaM6QSfs9NATxjbz8S
         8Y3btxPSiT5KT/HJ+YcWyxgTxyyH9QwS/sqmkYJdd2cn0w0ljlUHUUxVOwu2TbWAJCob
         0qh4cfHgvQ93OGytGAJ/L5rCNYLIidBIjzJlqWQjsOeaQnYPuDKxrFRx98mGhfAUpmHm
         5RPLl7GL7MyzBWhxR6AS6+QZoDWY9B5rJu/kaBpt9mJsMdjGl6CG0pW00aHPCJRcZLTQ
         h7L/rcfWUBCr3brbwMljrKIW5v/A2w0MkYOdYgYw+NKrR/flV3xCpc80llc/KsU0XUFw
         um5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789463; x=1782394263;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97YgfxmG6Chl0Ir+S9QMmQ5bxu5X/S2hJhh/DZ4TYTw=;
        b=DUejPyJlNWk4qJ1Btr8uiWiiQWvr3YFVPsiLH4peHf87y4SZ7l1yfHEztNr6RwjKlL
         ZzDELfZo9LZaYRB+p0D09KcD8vgoYFFmQ988RSwX8HTUCluX4y3vZSvHuWmRE3fEIw5r
         adZd3rNO3bRzZxsM/3xLX2rezEM/LyxzcLfsuh0W13KU1nPiqCIhs4ahI0/LIaOKnysQ
         v3w4a4JxNAOMQc649edDeCL8olz4bdBYE+B4UkoeJrKhe7zXKRP7FUIVvqP9yaNzVsJw
         FeHNElVO28C9MZJP5RoHf/gVGj+Vcel1NQxiqKVyiGVDqNykq8ajDqQaY5eqfG9CuGAa
         yBNA==
X-Forwarded-Encrypted: i=1; AFNElJ9hsDELVabVq9w37Ey7q1XSmuLvWWD6IyZ/RvFm/DLFc4Gg1mhTwbBO68t4S6WACdWNMK9wGgX+UhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrWCu3s1XSpp4nQQmtuq8uDnqHHIQ0WuBAKl7I9ueqnAZ2l9hO
	v2vMxSCo/rx9WWkNJmmy+OhZ0+d+ecR8MlXmmdSAUf8FCHxwONJwWMBvHjPD1c59Dw==
X-Gm-Gg: AfdE7clDsrUOgsJwXb9vbZ4WJq7SfCrGNM9rGYfFrnBaZbRFpneYGsz9ZDDru7tKM0X
	EdnYMiWvel+YPyEFic0xyk4YYkP/Er/ss11w+8bXYC7CuQ+pskqrgEucN3azn7NC/401PmNkzrq
	n9cAJQ9d2KuNA1eh4dUqyAORabm4Ro0ixDIiWxe88zDPRH1cf4jhvbW0z9zir6kHGTSdScY9AeL
	mhMgQMWXQuDe1OWQpmveKbWCPHncbpJLo4MUJS+Td2dXUy47PmvKlTXfO6G/6AAOjgePJ1v0iD5
	tZLli5eddYYNc9La3m7+2VWIwxUDwWSSL80JBLGFlY63BqMf9z8+yDObtJbSR1sSXsI5IWSFcvM
	Z+lJACRmAIU6MiuuvTtJJNIkyFF5Ez3OmV/kw3RhAAHc1AQo1kbnxKJMh1CNpq+Y6xeNF4TPk81
	nSsdmJkSqFvtoudaSrnILpvnlkUa5w+Egcth4aubhynecllWjY0A==
X-Received: by 2002:a17:902:d587:b0:2b4:58ad:e987 with SMTP id d9443c01a7336-2c6e8692cdamr1747625ad.17.1781789461980;
        Thu, 18 Jun 2026 06:31:01 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521aa16fsm9477952a91.4.2026.06.18.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 06:31:00 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:30:51 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Parav Pandit <parav@nvidia.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 01/12] PCI: liveupdate: Set up FLB handler for the PCI
 core
Message-ID: <ajPzC2Xh1NMbfokP@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-2-dmatlack@google.com>
 <178124130274.908199.14827357870284807134.b4-review@b4>
 <aiutNINqxhtlm2Dt@kernel.org>
 <178126123047.908199.12042730612990730743.b4-reply@b4>
 <ajB6V6yBHOjgK5ew@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajB6V6yBHOjgK5ew@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92773-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmatlack@google.com,m:pasha.tatashin@soleen.com,m:rppt@kernel.org,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:parav@nvidia.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhawaja@google.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFFDC6A09F9

On Mon, Jun 15, 2026 at 10:19:03PM +0000, David Matlack wrote:
> On 2026-06-12 10:47 AM, Pasha Tatashin wrote:
> > On 2026-06-12 09:54:44+03:00, Mike Rapoport wrote:
> > > On Fri, Jun 12, 2026 at 05:15:02AM +0000, Pasha Tatashin wrote:
> > > 
> > > > On Fri, 22 May 2026 20:23:59 +0000, David Matlack <dmatlack@google.com> wrote:
> > > > 
> > > > Please add Pratyush, Mike, and myself so we are notified directly of 
> > > > incoming patches, the same as with other areas where the liveupdate/ 
> > > > tree is specified.
> > > 
> > > Or we can add PCI liveupdate files to LIVEUPDATE entry.
> > 
> > That will not work, as we cannot serve as maintainers for 
> > PCI/VFIO/IOMMU/KVM, etc. David Matlack will be the maintainer for the 
> > PCI components, and we will accept patches once they have been approved 
> > by him.
> > 
> > The simplification we could do is to create an email alias 
> > for the live-update tree maintainers. This would allow us to use a 
> > single entry instead of listing all three of us individually.
> 
> We could create a Live Update mailing list for all code that can be CCed
> on all patches that must be merged through the Live Update tree. I would
> also be interested in subscribing to that list.

+1. I'd like if there's a specific Live Update mailing list for
submissions & discussion about the Live Update tree.

Thanks,
Praan

