Return-Path: <linux-doc+bounces-92122-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n9qJO3ocLGpnLgQAu9opvQ
	(envelope-from <linux-doc+bounces-92122-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 16:49:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA9767A524
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 16:49:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KqQ3m+ji;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92122-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92122-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 624E031A6C78
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 14:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D8A36C9D5;
	Fri, 12 Jun 2026 14:49:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C5924886E;
	Fri, 12 Jun 2026 14:49:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781275752; cv=none; b=obDdfYmmv18HRn4PiO6Lp832JxM2LSWIzoNG76IGF5pFXxXmi7DGooWWEFUYsK9dnGCmgowcPjq592ptXtyYI9uOP9layRpYPA0IlgMzCXakmSCgqdcd/gJUW7O1GlABSH7B7SUEhUZSb2c6iaD1v5fLTDa+tZOT4Hlk/ziVGE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781275752; c=relaxed/simple;
	bh=BJFzGzOnd+wP2T3OXbmcSnUl6hlCrHcAS6mwQMT6zrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPE2YdBVMcS9MLX8rgH8LdOvVPHY+xqdTfzS65Jf8TAWx5n1R2S9CdOZDnQx7NkWDu697q7ndEZTeFW4/MQF5aNFtiYf+MR94enFAakbmsnqy1UCRFbv6Rg0iLBmHf8O9+DukgeBwUpbT36w5T8UC+W0kP+LaiW/ZnWve6X/Xy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqQ3m+ji; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC861F000E9;
	Fri, 12 Jun 2026 14:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781275751;
	bh=qhPHLYbQyUfvef9/xCIIY8vt5USpJP7O50ve0Xr9Fco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KqQ3m+jibMcuY8vurw+rG7VdytA6Y6cMHo3roJQ8ImJswxu7g5OQsf6U9DmgKL9Ok
	 tMoVfnttQQhbTRLujJvFm4Z3bZ7gZzKPvuegSKFNGFlYLiavZptALOMGNFohVAJBsU
	 S2cf3GfT9s6pAt3G7PxxKl9WEcH0ikXnznL9+1kH7Dm5xiZa7amZAbjMwEevZ45B4a
	 vJr8GleYk5liMgzbxAkB3mPRM5aQevk6Yqrzi9aFtqJTDnvJHo9OtiT8zww01quWWU
	 JZFWZqvYd6+3/nlD+3b8S1gml9lQE6KMYyGi9pVigyovlwi1JcYwRC3L4eQz6SwZW2
	 qxF4lWtteSQaQ==
Date: Fri, 12 Jun 2026 09:49:10 -0500
From: Rob Herring <robh@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: Jonathan Cameron <jic23@kernel.org>, will@kernel.org,
	xueshuai@linux.alibaba.com, saket.dumbre@intel.com,
	mchehab@kernel.org, dave@stgolabs.net, djbw@kernel.org,
	bp@alien8.de, tony.luck@intel.com, guohanjun@huawei.com,
	lenb@kernel.org, skhan@linuxfoundation.org,
	vishal.l.verma@intel.com, rafael@kernel.org, corbet@lwn.net,
	ira.weiny@intel.com, dave.jiang@intel.com, krzk+dt@kernel.org,
	catalin.marinas@arm.com, alison.schofield@intel.com,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	Michael.Zhao2@arm.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	Dmitry.Lamerov@arm.com, devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 09/10] dt-bindings: firmware: add arm,ras-cper
Message-ID: <20260612144910.GA989816-robh@kernel.org>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
 <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-9-2e0500d42642@arm.com>
 <20260529174407.7081ad0b@jic23-huawei>
 <ceb19cb6-7083-44ad-a262-a8198f489257@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceb19cb6-7083-44ad-a262-a8198f489257@arm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92122-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ahmed.tiba@arm.com,m:jic23@kernel.org,m:will@kernel.org,m:xueshuai@linux.alibaba.com,m:saket.dumbre@intel.com,m:mchehab@kernel.org,m:dave@stgolabs.net,m:djbw@kernel.org,m:bp@alien8.de,m:tony.luck@intel.com,m:guohanjun@huawei.com,m:lenb@kernel.org,m:skhan@linuxfoundation.org,m:vishal.l.verma@intel.com,m:rafael@kernel.org,m:corbet@lwn.net,m:ira.weiny@intel.com,m:dave.jiang@intel.com,m:krzk+dt@kernel.org,m:catalin.marinas@arm.com,m:alison.schofield@intel.com,m:conor+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:Michael.Zhao2@arm.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:Dmitry.Lamerov@arm.com,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-edac@vger.kernel.org,m:acpica-devel@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FA9767A524

On Thu, Jun 11, 2026 at 03:22:21PM +0100, Ahmed Tiba wrote:
> On 29/05/2026 17:44, Jonathan Cameron wrote:
> > On Fri, 29 May 2026 10:50:49 +0100
> > Ahmed Tiba<ahmed.tiba@arm.com> wrote:
> > >   .../devicetree/bindings/firmware/arm,ras-cper.yaml | 54 ++++++++++++++++++++++
> > >   MAINTAINERS                                        |  5 ++
> > >   2 files changed, 59 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
> > > new file mode 100644
> > > index 000000000000..3d4de096093f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
> > > @@ -0,0 +1,54 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:http://devicetree.org/schemas/firmware/arm,ras-cper.yaml#
> > > +$schema:http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Arm RAS CPER provider
> > > +
> > > +maintainers:
> > > +  - Ahmed Tiba<ahmed.tiba@arm.com>
> > > +
> > > +description:
> > > +  Arm Reliability, Availability and Serviceability (RAS) firmware can expose
> > > +  a firmware-first CPER error source directly via DeviceTree. Firmware
> > > +  provides the CPER Generic Error Status block and notifies the OS through
> > > +  an interrupt.
> > I'd like some spec references in here if possible.
> I can add a reference to the UEFI CPER specification for the Generic
> Error Status record format.
> 
> For the firmware-first DT description itself I do not have a more specific
> public reference to cite.

Is there a platform actually using this with DT (FVP doesn't really 
count)?

Rob

