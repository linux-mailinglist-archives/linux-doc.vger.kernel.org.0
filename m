Return-Path: <linux-doc+bounces-81694-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id E9MBButoyWnqxwUAu9opvQ
	(envelope-from <linux-doc+bounces-81694-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 29 Mar 2026 20:01:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5B535376A
	for <lists+linux-doc@lfdr.de>; Sun, 29 Mar 2026 20:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7B05300EC94
	for <lists+linux-doc@lfdr.de>; Sun, 29 Mar 2026 18:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF841DC1AB;
	Sun, 29 Mar 2026 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YCwOPgcZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C4C386C26;
	Sun, 29 Mar 2026 18:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774807270; cv=none; b=Us8QLFLecgECcM893iRlY6LzbfTnuNMHh39qCX4SItp42z7PsHhp/ijVZCD76CJBXsZtF5U15PLhD4FxD8x2I6pIpsOWU1VY3E6LFW3TA3Ssew3aspm7K/JANdAwbluP6UZa0/CMyZvGy98smAQO+EtAdFUE7h8Qzsc2hD6ivc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774807270; c=relaxed/simple;
	bh=HKatBNWBO7yrOGYf1pOvBsP48x6K9AIg6H3XVc/TJbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgxP+Nnw26Iz9EA+GRrLsE9bszyYV7qzfKz8mmV0O6zqJG6trYoAmievu95QRKnAU0RQiEHgifHLz/c2rGvnMSWiUnw3psaNnl6KTFCwnSf6e9IbsJi81o3m+1fi2o9Qs9rgMPPce9pyT9xKQSs5byglLnColbcPUeIPMTaaTMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YCwOPgcZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1379A1595;
	Sun, 29 Mar 2026 11:00:59 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A8BA3F7D8;
	Sun, 29 Mar 2026 11:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774807264; bh=HKatBNWBO7yrOGYf1pOvBsP48x6K9AIg6H3XVc/TJbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YCwOPgcZIVYs3aDQ0ppSMQfkYBYlGucjp7xkJ5OFSjnc9K/ooxAme9pTzGioZXxsv
	 4y2ctyjetjwvKVc+2YlDF1AEb+p7VdsB7ICiSxpHIZiADz1MhL8stn2jTBscXBKW9i
	 v84HJwGTet3zeESOelw+I13CF6GhWbUH8++3TEB4=
Date: Sun, 29 Mar 2026 19:00:54 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, etienne.carriere@st.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, d-gole@ti.com,
	linux-fsdevel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-doc@vger.kernel.org, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, philip.radford@arm.com,
	souvik.chakravarty@arm.com, peng.fan@oss.nxp.com,
	dan.carpenter@linaro.org, lukasz.luba@arm.com,
	arm-scmi@vger.kernel.org, sudeep.holla@kernel.org,
	michal.simek@amd.com, linux-kernel@vger.kernel.org,
	jonathan.cameron@huawei.com, elif.topuz@arm.com,
	linux-arm-kernel@lists.infradead.org, james.quinlan@broadcom.com,
	devicetree@vger.kernel.org, brauner@kernel.org
Subject: Re: [PATCH v3 06/24] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
Message-ID: <aclo1laTrsQFSan6@pluto>
References: <20260329163337.637393-1-cristian.marussi@arm.com>
 <20260329163337.637393-7-cristian.marussi@arm.com>
 <177480549380.3925363.5137815678176793743.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177480549380.3925363.5137815678176793743.robh@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-81694-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,st.com,kernel.org,ti.com,vger.kernel.org,gmail.com,linaro.org,oss.nxp.com,amd.com,huawei.com,lists.infradead.org,broadcom.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:dkim,arm.com:email,0.0.0.19:email,devicetree.org:url]
X-Rspamd-Queue-Id: 6D5B535376A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 12:31:33PM -0500, Rob Herring (Arm) wrote:
> 
> On Sun, 29 Mar 2026 17:33:17 +0100, Cristian Marussi wrote:
> > Add new SCMI v4.0 Telemetry protocol bindings definitions.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > ---
> >  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/arm,scmi.example.dtb: scmi (arm,scmi): protocol@19: Unevaluated properties are not allowed ('i2c2-pins', 'keys-pins', 'mdio-pins' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260329163337.637393-7-cristian.marussi@arm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 

Yes...the new protocol block definition ended up intermixed with the
previous protocol block...totally wrong.

My bad.

I will fix in V4.

Thanks,
Cristian

