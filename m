Return-Path: <linux-doc+bounces-94171-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BmY9ExvLQ2qriAoAu9opvQ
	(envelope-from <linux-doc+bounces-94171-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 15:56:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9506E51CE
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 15:56:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OYLpV4xa;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94171-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94171-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2E72303F7C4
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 13:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B4E3C4162;
	Tue, 30 Jun 2026 13:52:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151BC2FA0C4;
	Tue, 30 Jun 2026 13:52:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827529; cv=none; b=LePo1xF2etFNbbyHFwqVB3Fu3wumNhXVMInuTCLKN7J5Ucpba02koYGDv3iEy0Sxv3Q6C/92rJNuRfpVTakH9YARzLhtViIFLwwlXKeSvCviUaVMVFJbfP8In6Avkpbe/3FaJSBc3y5aVU9DquleLkhVFZGnAeNUzfa84aImK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827529; c=relaxed/simple;
	bh=fcrjvHyRgEDnEyKZthITYPFPQmO3YCO/vYrKNtCSOkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hd9qeRriKr1rHPvXtgyxmp6ZAashv6StHMKxhZdgF253Rm91U7Sp6+TwuaJwUVxc8OyfuAQDn5G9Mi+GZpJiF/HAtaJo7eSKdRug7bYg/RgVfTXSVWx+JkSEHlzOx82OgDKopzKZU1eEcj2PfX8FEkoEI5LXxvmnZBNDbv1mxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYLpV4xa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C6F1F000E9;
	Tue, 30 Jun 2026 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782827528;
	bh=LIxDCIqGoO5YnS7sM89lDYN7/qU1dT6KiPHIvC5H1+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OYLpV4xaZjrElX/uvSWuXZD4SkkGn8NaPB8gcw1FkeLXh3gsJE3enB5YGDzMACuUm
	 xiQuq7RXBrppXszJMeSSHON6WB6lYMao07R8wnK+D2EJEh63FRz+Gw4HzkHv/lT3D3
	 BMim+rVqXKKw1S8lmk0Q8FnLrLrGAucqTYQ4ttrXK7eDC5LSmhA+HnXiywYfWMHqrp
	 iM+w3JQQW6SFBqZ3A8yR122tXa+8Rf9L+FPLoxFQBcNVtyzmqOHdO4ySLVvdUbRbV9
	 TycjXPq5lFHCEA23EshuBsFqrIoAqCmA6fdGumf0qnVCtWevDh0tEFW5hGjGa/rcxq
	 TWugaKofRcx8A==
Date: Tue, 30 Jun 2026 08:52:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: Dan Williams <djbw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	Dmitry.Lamerov@arm.com, linux-acpi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, acpica-devel@lists.linux.dev,
	Saket Dumbre <saket.dumbre@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
	Ira Weiny <ira.weiny@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 09/10] dt-bindings: firmware: add arm,ras-cper
Message-ID: <178282752577.2979480.8944194387626033684.robh@kernel.org>
References: <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-0-91f725174aa0@arm.com>
 <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-9-91f725174aa0@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-9-91f725174aa0@arm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94171-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ahmed.tiba@arm.com,m:djbw@kernel.org,m:rafael@kernel.org,m:jic23@kernel.org,m:bp@alien8.de,m:tony.luck@intel.com,m:alison.schofield@intel.com,m:krzk+dt@kernel.org,m:linux-edac@vger.kernel.org,m:devicetree@vger.kernel.org,m:skhan@linuxfoundation.org,m:guohanjun@huawei.com,m:mchehab@kernel.org,m:dave.jiang@intel.com,m:xueshuai@linux.alibaba.com,m:linux-kernel@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:Dmitry.Lamerov@arm.com,m:linux-acpi@vger.kernel.org,m:conor+dt@kernel.org,m:acpica-devel@lists.linux.dev,m:saket.dumbre@intel.com,m:dave@stgolabs.net,m:corbet@lwn.net,m:lenb@kernel.org,m:ira.weiny@intel.com,m:vishal.l.verma@intel.com,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF9506E51CE


On Wed, 17 Jun 2026 14:54:47 +0100, Ahmed Tiba wrote:
> Describe the DeviceTree node that exposes the Arm firmware-first CPER
> provider and hook the file into MAINTAINERS so the binding has an
> owner.
> 
> The initial user is the upstream zena-css platform, validated so far
> on FVP.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
>  .../devicetree/bindings/firmware/arm,ras-cper.yaml | 52 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 +++
>  2 files changed, 57 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


