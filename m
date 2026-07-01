Return-Path: <linux-doc+bounces-94403-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Aze/DP84RWpE8woAu9opvQ
	(envelope-from <linux-doc+bounces-94403-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 17:57:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D016EF6BA
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 17:57:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OEOXN1Cb;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94403-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94403-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4180C3024A5D
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 15:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C046348C8B9;
	Wed,  1 Jul 2026 15:54:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A84E416D01;
	Wed,  1 Jul 2026 15:54:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921254; cv=none; b=Cp09jOrbfXRzB4W5Bddfpr63TcfFVIeE329oGd/HPbqk/yRY3w9PinJ1ZkxkspkwyLeMVbsTbXwTbWLsbqjg0ufVKEM0aTuHnS3+hpnpHSXXI+BVFLZtlfe4yMQRLDzHRw7UEsseIuSFhz+RuMlmTTbT4/ZRgI30H9qu7Ec1sVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921254; c=relaxed/simple;
	bh=G1qx4lJ/FOReXWbODYP3XMesRUo+qlxSfgomKdm87DA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=f7zTUP98vzOFo1KFPqQMogXU9/vbSR71GFOOcgYLw+8l3yAa8eXfzQS7OEQdr6i9sqsecVBjmdPl+E3AfAXoza7SLO97G0UEDuFCgLaV0GjfhpxB+c1BUpEEJpyC6RXpIK1oCdEZhNu3c4HgdJsXsqeWQF0nPHcg9qDk99sPZ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEOXN1Cb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90E71F000E9;
	Wed,  1 Jul 2026 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782921253;
	bh=Day1pHQbKZLb168bI+sP1UZxbLRw56ZZ/BDr3gtOMiQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=OEOXN1CbmqbmzOHS4xMU9zz61FwVoCI0s68qSt/fMFnPQAtQDSI9WRjlK+tUTfm7W
	 YMGFkMn0G8o79DO1GWLJHoAFBmpvbYb7AMyNFQ1CBAOH3lIZ1XdwqwfXztENUdEGOP
	 VsJ8LHmL5fgC5eFahjw3d+/4fx6zGP30xf5NOjXyx57RHcxnBNqPOqpIcjlEu09pgX
	 kM2HD76Qskh2xjdNXvo423hw6HGkgGW4VB6wuRzMNJ90GISmxlQfHInTfCe6v9hs0B
	 S3fk2J2JC82vh8hKsk0tW2YbnNLhgV8eJWG7PcgoKKGbVj8C8+JV1L+g+4CbHU04gr
	 MuldJFsj5M1IQ==
Date: Wed, 01 Jul 2026 10:54:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>, sophgo@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Inochi Amaoto <inochiama@gmail.com>, 
 kvm@vger.kernel.org, spacemit@lists.linux.dev, 
 Jesse Taube <jtaubepe@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, linux-doc@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 Chen Wang <chen.wang@linux.dev>, linux-kselftest@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>
To: Guodong Xu <docular.xu@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
 <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
Message-Id: <178292125218.626337.4829523300943840761.robh@kernel.org>
Subject: Re: [PATCH v5 08/17] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94403-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:debug@rivosinc.com,m:sophgo@lists.linux.dev,m:conor.dooley@microchip.com,m:alex@ghiti.fr,m:corbet@lwn.net,m:inochiama@gmail.com,m:kvm@vger.kernel.org,m:spacemit@lists.linux.dev,m:jtaubepe@redhat.com,m:atish.patra@linux.dev,m:paul.walmsley@sifive.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor+dt@kernel.org,m:pjw@kernel.org,m:dlan@kernel.org,m:unicorn_wang@outlook.com,m:linux-doc@vger.kernel.org,m:zong.li@sifive.com,m:conor@kernel.org,m:skhan@linuxfoundation.org,m:aou@eecs.berkeley.edu,m:anup@brainfault.org,m:thecharlesjenkins@gmail.com,m:andrew.jones@oss.qualcomm.com,m:krzk+dt@kernel.org,m:linux-riscv@lists.infradead.org,m:chen.wang@linux.dev,m:linux-kselftest@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:palmer@dabbelt.com,m:docular.xu@gmail.com,m:krzk@kernel.org,m:docularxu@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[rivosinc.com,lists.linux.dev,microchip.com,ghiti.fr,lwn.net,gmail.com,vger.kernel.org,redhat.com,linux.dev,sifive.com,kernel.org,outlook.com,linuxfoundation.org,eecs.berkeley.edu,brainfault.org,oss.qualcomm.com,lists.infradead.org,dabbelt.com];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52D016EF6BA


On Wed, 01 Jul 2026 08:52:21 -0400, Guodong Xu wrote:
> Zicbom, Zicbop, and Zicboz have no default cache block size, so a
> devicetree that declares one must also provide the matching
> riscv,cbom/cbop/cboz-block-size property. Make it required so a
> missing block-size property can be caught by dtbs_check.
> 
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v5: New patch.
> ---
>  .../devicetree/bindings/riscv/extensions.yaml      | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0 (riscv): 'riscv,cbom-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0 (riscv): 'riscv,cbop-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0 (riscv): 'riscv,cboz-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0 (riscv): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1 (riscv): 'riscv,cbom-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1 (riscv): 'riscv,cbop-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1 (riscv): 'riscv,cboz-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1 (riscv): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10 (riscv): 'riscv,cbom-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10 (riscv): 'riscv,cbop-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10 (riscv): 'riscv,cboz-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10 (riscv): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11 (riscv): 'riscv,cbom-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11 (riscv): 'riscv,cbop-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11 (riscv): 'riscv,cboz-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11 (riscv): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


