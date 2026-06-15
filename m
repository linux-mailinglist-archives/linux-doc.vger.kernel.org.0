Return-Path: <linux-doc+bounces-92426-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id duOLH31fMGoBSQUAu9opvQ
	(envelope-from <linux-doc+bounces-92426-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 22:24:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23332689D0A
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 22:24:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=vNTveM76;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92426-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92426-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C00CF318366F
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 20:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D85E3B47E5;
	Mon, 15 Jun 2026 20:20:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DBF3AFAF1
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 20:20:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554841; cv=none; b=WaInFFatpk99BZM20Qm/F5oXq9o5Ov0nW4q4cGQuYtLaN9vC0Y0XONXsR1OC36oGGVVqQgucfYeOw8yP/O8Km+bcU8/oAsItZ0qK8HySnLz1jVycd7RNvNAdTgSNjFH8ojZRxeY3UVpajnnyhDw6FjMV2tR4fLr/FButgcW/6D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554841; c=relaxed/simple;
	bh=TB32LhnDXfTJUQ0KhV0DDq8feI4v0a+HUW9AsVhyJdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hA5h6oJAV6kvdQ+KGdW707+hfY2CMjipckO1DLlAfZ7WRvxK46NmPObE+8hVEnAlqJBezj+aaXhCJPM/f6vESEUuS+U83lf2s7GLJ3tM+SPTuSqXQTdoAdUkBM9CDZryGlP6kn9trgiU3K7b2317tWmT7bSTC+gRxUuxa3zJyxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vNTveM76; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36bcf3d2565so2705653a91.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 13:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781554839; x=1782159639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ynJ3evPKTv+CHJxYf+R9sPicm7rQMH20Hi7EX5GWIM=;
        b=vNTveM76TEMCSRUshuxZaW48EjNLGh6Ln6suviRcRPJzFhgEiE6DDrImXx6rhXWqZq
         lKvF2dtcX0RKpWaeiz9imfVLoXkQGrTKi9prUWq/BA5LKtXQ6qbTStp1pzQSUO7j1fBa
         KJxMKYuFDY4HjLXt2CIiNFEDq+2uFiEWnmo02HGo/tpoAdXLdh6iSkSZ4AItvGKSb8Mu
         kVBCrLsyuip0I+yj5E2Bfz2Iqz0bSYXreDG48D09IJ3iSWT1MARgtsRBdGPgqb3O7Jfn
         ags4vSnZ+4bY+Mty/ELtGHTYWPYx/096SbHXH22qItXvmqQq7g/2IDcip+x8k9zciPXi
         suOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781554839; x=1782159639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ynJ3evPKTv+CHJxYf+R9sPicm7rQMH20Hi7EX5GWIM=;
        b=Sn6jX4yGkKtqnbFO0wCNFnXseCoQ5GYuxp1C5phjrG5wPqVdvcHMjEz6I70ICWbxuq
         4S6Ok6tDXJDANCPeM28a/9EBZPiAIWXZF0FAOlkFPJ5jUk514ukFQRCKR+y8eWhDn8Jm
         7PRC34DJSSSkVAcVNzEEGzQXK8sJa70XZAZkNOPEskGY5VKiwU7WeAExeQBZSnQiu2pm
         Bj3f/1UkH5ie/HazR//mmkRGzggdWshuIq2XZZM6z8jqX0p/Y9J3qzhtIQijx+E7FcfO
         Xvekm63sJTwr9YGX3GhS1MrYrkK488yurd5HfpYnOzulaM7bBlWAwwuFCaplOpNTmR3v
         O/bw==
X-Forwarded-Encrypted: i=1; AFNElJ+56uwnu0GEDmi4oEl5jDpNjRm86A8oLpE4+Bn/Yp3Bp9tUOI5tiKeRf7mlpUCUyuL6VDt5MKVmBUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvBTVT/5HHXe24Z+aKTFBPB/oDgFWv0vGcC6nc89Vs/1IQ6kIx
	JI/IIp6AlREVVng09XluizZSvyIkEC8lHttLxm8ecE5gwYhxU90osjUCwJvjFWsEgA==
X-Gm-Gg: Acq92OHJk5AURMthTG7w/6c9qV4Ai83SwyLxLOp2fIA+5jNLa8Q2UJk4W9Qs6zxLT+6
	FEYFnDZw6KdbaXPr6pU3alb63tl8iG1WylKU3SG+N6Bx9qfpUdiFlT0jvayemskxt/Vh/B7VS7P
	RpvLiOKcD5uRw5qd+/X8o7M4uspZeeDebWffIYd+J21LOfK6hPrqdgAggIjKmnZLa1OM9Qiwf+Y
	6Kv24EEDKJXl4UQaqbtdEsR9L9ccPBHV40o5SfR1HXQk1nY+68MeJKO6dC7e/TRjZcTN0mtH32t
	8Fs4sb7IYs6RJ7WmbgFW8jxA4zLTQTxAcxSJeyzxvVCYSyAvU26hqHkO+Hkv1r0ry0Ond3EK6MJ
	MlbJnHoHWcF8Fa6Oy0PddO/K1BKVOXcQj5/niNg49b4VPZ6OUN4EYt26XunOHoQ/lDPd1gDSbQi
	yZzpVBFc7Ke5JVmbVHgYgt/aMJsMNETDYj/5g4GvGlBaCV4xEL/X083WorbL/HsQ==
X-Received: by 2002:a17:90b:2f05:b0:368:6998:b4a9 with SMTP id 98e67ed59e1d1-37c2bc7c378mr12049662a91.11.1781554838812;
        Mon, 15 Jun 2026 13:20:38 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521d96ddsm470060a91.6.2026.06.15.13.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:20:38 -0700 (PDT)
Date: Mon, 15 Jun 2026 20:20:34 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
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
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 05/12] PCI: liveupdate: Keep bus numbers constant
 during Live Update
Message-ID: <ajBektwaDID-NqQk@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-6-dmatlack@google.com>
 <178144546090.1266136.8524338598480624580.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178144546090.1266136.8524338598480624580.b4-review@b4>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92426-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pasha.tatashin@soleen.com,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:rppt@kernel.org,m:parav@nvidia.com,m:praan@google.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhawaja@google.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,soleen.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23332689D0A

On 2026-06-14 01:57 PM, Pasha Tatashin wrote:
> On Fri, 22 May 2026 20:24:03 +0000, David Matlack <dmatlack@google.com> wrote:
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index 4f2ec6ffdd16..2421bc218916 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
> > @@ -103,7 +118,7 @@
> >  /**
> >   * struct pci_liveupdate_global - Global state for PCI Live Update support
> >   * @rwsem: Reader/writer semaphore used to protect the incoming and outgoing
> > - *         FLBs, and the references to them in struct pci_dev.
> > + *         FLBs and references to them in struct pci_dev.
> 
> This change does not belong to this patch.

Yes, will fix.

> 
> > @@ -396,6 +411,72 @@ static void pci_liveupdate_flb_put_incoming(void)
> >  	liveupdate_flb_put_incoming(&pci_liveupdate_flb);
> >  }
> >  
> > +bool pci_liveupdate_scan_bridge_begin(struct pci_bus *bus, struct pci_dev *dev,
> > +				      int pass)
> 
> This function requires a header comment; it is public and not self-descriptive.

It is private to the PCI core, but I can still add a comment in v7.

> 
> -- 
> Pasha Tatashin <pasha.tatashin@soleen.com>

