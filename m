Return-Path: <linux-doc+bounces-93264-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6MTbNLS3OmpVEwgAu9opvQ
	(envelope-from <linux-doc+bounces-93264-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 18:43:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 544BE6B8CDB
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 18:43:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=Cdl99HR3;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93264-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93264-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1914303BEA5
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 16:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD41319617;
	Tue, 23 Jun 2026 16:43:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15A7318EF4
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 16:43:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782233010; cv=none; b=Jqp6bOJYdA54P1Hq8NQBOctXBPIgmx2IvvwZPTf2yJ0eIkytlYcMDA/w5Tnx5vSXAXcgYt7GqLJJJGwUEnapijrHCSDc37bj4M75XUqCe6vKJPD8YTGGNrtpWK2uIaFCr6fzKtRWZn/6PQLhgIR0B7o0nOtrHRg6gPKPu6IkrkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782233010; c=relaxed/simple;
	bh=IO3IaUu1uKZodchtwQMhsQsxdlAFl5DLnFq9KPo2zhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXPykJv6VBOztoWWu+K4EQUUessJb56eMNaMCDxGTFgM84+BfkrVynaJrUjVKLM81+Wl9RERja0ZUlvPoelTPwd0POkTKjxjf5RYDaQMkbqIkc/4mr4ZSidoRzJs4emGnD8SY7E5d/XqFwldnVTqehdd24/iJDWENriWB52L1Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cdl99HR3; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c73cefe192so62475ad.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782233009; x=1782837809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUCXLhb0bwQI5jAi3AeGaL2pacxrrvJDt+WvFjr4LkY=;
        b=Cdl99HR39ZuMN5pAxlyTpkTp+JYMHqFOLaZT6eC9ydbSpoNDo2TtWUofubD4GOK6zr
         S6pk3SpVtH/5m1BPz7Q6hHO0sprLfoUOtSsPtUJLs7l4HvILulka91DehDl9Qu5FkNjm
         nzWe4xPUeS3anFsM7Kel37guFGY1+wwYFgxRrXtMXF4GklhmFqAvW4FnhXqPNNLuC2MC
         /KHU9DUVXDvP6dLBNsdY1kIYoeJlu3SegQzxlBE7MHK17R4jMlnFLY5Jnc9ETFFEk4jB
         6wAvKxLGiNONuDR5EAkEoVUBS1Y5tDuPIhoO2MMas9sukdUoMfEjavjQJv4X5uyTW1af
         kG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782233009; x=1782837809;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUCXLhb0bwQI5jAi3AeGaL2pacxrrvJDt+WvFjr4LkY=;
        b=f0HGNXZwg61EKnyMx2zRICdVCNXi+Ak7Cbr0p4oBkftXQgzdUiP8yQ1CPx4UNsMwLN
         +6GB3Vyu24oiOl+F+PdZAx65RDfTfiDU8S7DqZXZ2oh/aDIxuL3fyiRvUZNpjeW+MU3l
         Z+NUJuazun48wqq8gglNj72NxP2mTdVsfqAx5fAvCNzFW/gk0eAnnRVLqAfbDUCPnRSZ
         mBSFCDlOy5XPq7cvtO+db/7cThz6DajtL8QmypUVkVmU1o9pavLfnY7TsOIWecaeD732
         ZFfIsQevAq+btVvx91izR8FuU3RlU9BrFX3rdGSdq+h8VZi5wCniJQXobEBGM4Nf4W1f
         j2Sw==
X-Forwarded-Encrypted: i=1; AHgh+RqXhii++ZzMLdK9a9bsztpXQAL+t9KhfqQRdUKuu1xmdFaoj20x9rICdtI6oObyxPyV/XXLS6f/D3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Fl6Ad9ivG9LbSAQ5MZHm42ehs9or96lUgbIMs1qehAlltvZI
	MmNhwBlSimsXXC8Mn8eP0P0TaIkupB2aG9H2VTIRThv33Q4BULMhKVcFaI70AzaQNg==
X-Gm-Gg: AfdE7cnr4aieilFYSEgFUSYVFf9GNG0PuOk55+rUO5XMGdtIjjrYmbeeS/aeWkGzops
	cPTMImdN/ZAG7e9IzeerhdfFyJ/4IVNUVy89FyDKOeTBfV52cu5fbkG1eiLldsDWn2+mSy+tVYT
	FSPEqv546njaWcgeBmYE3o+rStKT8uxUlbLGAciUt2/WsRM/NXouDQe0smVoE0opNJxLZi2ST/l
	83AMVjCDfFvIBgMAIOyEoYrCezDXK8VcEvhgGqAk0erWwJbSkFB6WeKMQlYIrYOajZ8Uz5K7lFz
	HrND2IMPFynR22Sg3mqARnu9Z7CwuT/Cka748A4nHPEnY+3GmO2fIGkVyC/++JTRFtU/QbDYmZX
	ms4mmaVCGm4phMMrgGZR+WfgJGaBjEsztn+bJkSHcWTXUSjnatmryBJ1L0CeiyOttQlpudZbfKs
	4uxSLeC+beutc3McE/TBjkpsn0JthoGaCdr21XyS/xt+AGhL+SYsIZ3aSEIWPeNSaZxTK7AgIZx
	FQcwMZD
X-Received: by 2002:a17:903:320a:b0:2bd:6dad:7ccd with SMTP id d9443c01a7336-2c7c7118b8amr2140445ad.25.1782233008303;
        Tue, 23 Jun 2026 09:43:28 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c5dbsm10669159b3a.12.2026.06.23.09.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:43:27 -0700 (PDT)
Date: Tue, 23 Jun 2026 16:43:24 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 04/12] PCI: liveupdate: Document driver binding
 responsibilities
Message-ID: <ajq3ohoU2hJfhsp5@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-5-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260522202410.3104264-5-dmatlack@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93264-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmatlack@google.com,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:rppt@kernel.org,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:praan@google.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[skhawaja@google.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhawaja@google.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 544BE6B8CDB

On Fri, May 22, 2026 at 08:24:02PM +0000, David Matlack wrote:
>Document how driver binding works during a Live Update and what the PCI
>core expects of drivers and users. Note that this is only a description
>of the current division of responsibilities. These can change in the
>future if we decide.
>
>Signed-off-by: David Matlack <dmatlack@google.com>
>---
> drivers/pci/liveupdate.c | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>
>diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
>index 96c43b84532c..4f2ec6ffdd16 100644
>--- a/drivers/pci/liveupdate.c
>+++ b/drivers/pci/liveupdate.c
>@@ -70,6 +70,22 @@
>  * preserved. These may be relaxed in the future:
>  *
>  *  * The device cannot be a Virtual Function (VF).
>+ *
>+ * Driver Binding
>+ * ==============
>+ *
>+ * In the outgoing kernel, it is the driver's responsibility to ensure that it
>+ * does not release a device between pci_liveupdate_preserve() and
>+ * pci_liveupdate_unpreserve().
>+ *
>+ * In the incoming kernel, it is the driver's responsibility to ensure that it
>+ * does not release a preserved device between probe() and
>+ * pci_liveupdate_finish().
>+ *
>+ * It is the user's responsibility to ensure that incoming preserved devices are
>+ * bound to the correct driver. i.e. The PCI core does not protect against a
>+ * device getting preserved by driver A in the outgoing kernel and then getting
>+ * bound to driver B in the incoming kernel.
>  */
>
> #define pr_fmt(fmt) "PCI: liveupdate: " fmt
>-- 
>2.54.0.746.g67dd491aae-goog
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>

