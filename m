Return-Path: <linux-doc+bounces-83737-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA7TIWih4mmv8QAAu9opvQ
	(envelope-from <linux-doc+bounces-83737-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 23:08:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AB37141E9A1
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 23:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BDDAA300680C
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 21:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EE73290A6;
	Fri, 17 Apr 2026 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxb3+uSn"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6CF2BEFFF;
	Fri, 17 Apr 2026 21:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776460127; cv=none; b=G+ltMmEvRGN9+jpVgvPnZClCt8sskVD9hIigWJapB3H8VOfYUM9XZvojPYq5nvCY+8VRYi5XrSvo+pdDaq8GNTGmh2ts0jeYk7JVrWwzliwaUGP2WtkJ0Oph86pUBvjxRp26wAZ/zSVuy68pw/YF2tGwtZ3lOn9QXEe1fA7a+Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776460127; c=relaxed/simple;
	bh=MlXq0E4vLxLPXAKEw640HPvJY2bMGUevY4/dF94aKgE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mG5XNUwom/zyOKcNw+jxeNHWCPLDCvv2/NCbIeFdLHg+siZpesobxpHljETYL4CzS0c8IPB44QoU5bZIXesjrGkFu32Tti3HUeJSZ7lnHP8UuUqylvJvlibHMnHZO4QBINaa4IIF5Z/UflBOlD+de9OW5FmZfyMkEB4m0YHQ3Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxb3+uSn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5371EC19425;
	Fri, 17 Apr 2026 21:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776460126;
	bh=MlXq0E4vLxLPXAKEw640HPvJY2bMGUevY4/dF94aKgE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mxb3+uSnxRr6/OVoGFDF+IlJsrhMEDLoS0wDed5eHAjq1x+30saw+3SIduDnjaC5d
	 3hVGIaFFLmKFGTVrq5qedL/dzA2W20siQL2K4NZGa+Enw909+/oCIzOzkUjVMzZvbR
	 g+qA95jspvty4OByC0mjMd5ET1rXoKF6DJaejQVD/LDLWSH/KA1SWhITNBYLYRL/e8
	 RGj5VfrkYP3KDokJ1SVSkrf0v3zZE0FqB4zgSJQ0860XqsTosUgeDGSxwJELX3fwKB
	 taHhcy73LJ6fgVvU02Ay3wrDb/AI85FICnrpQ3BEnicEg/8NyD8IiuwmGTYXwZi2G3
	 eKvLQ+0ZbAXmA==
Date: Fri, 17 Apr 2026 16:08:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
 devicetree@vger.kernel.org, Drew Fustini <fustini@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, soc@lists.linux.dev, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <20260416-send-v4-2-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
 <20260416-send-v4-2-e19d02b944ec@gmail.com>
Message-Id: <177646012448.2165534.5760108355183774935.robh@kernel.org>
Subject: Re: [PATCH v4 2/8] dt-bindings: arm: Add zx297520v3 board binding
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83737-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB37141E9A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 16 Apr 2026 23:19:10 +0300, Stefan Dösinger wrote:
> Add a compatible for boards based on the ZTE zx297520v3 SoC.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> The list of devices is the devices I have access to for testing. There
> are many more devices based on this board and it is not always easy to
> identify them. Often they are sold without any branding ("4G home
> router") or with mobile carrier branding.
> ---
>  Documentation/devicetree/bindings/arm/zte.yaml | 25 +++++++++++++++++++++++++
>  MAINTAINERS                                    |  1 +
>  2 files changed, 26 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/zte.yaml:19:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260416-send-v4-2-e19d02b944ec@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


