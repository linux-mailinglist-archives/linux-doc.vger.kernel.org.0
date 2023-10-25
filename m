Return-Path: <linux-doc+bounces-1108-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1D7D6C7B
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 14:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E2FC2818EE
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 12:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAC826E3D;
	Wed, 25 Oct 2023 12:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Nq3lJYRj"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754378467
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 12:57:50 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10708F
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 05:57:48 -0700 (PDT)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7C58D3FA8B
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698238666;
	bh=YZ12GF+aERDoIF3r6TEMZGT37W8A+JNypJswAaYxRhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Nq3lJYRjmvlNFzhC88nKA+acZLBDUj9Ov5G9LL4MuBCW+ekeopmaP6jh1I3O7zSi3
	 VHcgE4W3aVos+T3jx4sC9AuqdjMKXzFYdSIp7QtXybesE78Tp0Y+I9/UCodeFPk9vy
	 bhlFQn1hVxFVdvg+jlfaHTMdnjHRibS57BNgxU/3ADQoqprN+STbnIyn84Fqeue9z4
	 wueAES6fHVy8EtziuEz7fG/7tmbevvB9wpoMp9MhLoHG/JlQYoWmizinkzN1jdNFyW
	 rMz82xE0dxseXyB0G1AIoOTTCiGq4xJIkoTNpvV6GCnM4v2+Sif16TcizvuwguCX3v
	 qRT5RAREbrXog==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-32d933caa8eso2278203f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 05:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698238664; x=1698843464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZ12GF+aERDoIF3r6TEMZGT37W8A+JNypJswAaYxRhM=;
        b=AouIE9Au+95G9uddlpH7OA4R9vVjhVsnuLceQn34K7qFmPweQjYRpRagUfQV5HA0So
         FgGR3sQxECKp0HsiA7fvMA1W4npsFr5vHO9PUHi5dqZdIkBN/7GMkmHfTM23tgO5GmhG
         yeEh+OV7SAifrlkCInV+q3axXdWQDuyDZo1vLyT6yVsvK0HFByUxCS9sVdgAgFWPBTDV
         NMPc+0xya6mF62ohWvoMS9M0Zmo2EmFm7XK5LL6z6EeZD8DoLPK0KWZ8wyFZhFG840tD
         XaaQ6TyNPSkjzGIqOWrptopcQO55HWnBivfKcPuPOeDfnMw8auNJviRyJ51pfE9s2jr7
         vxtA==
X-Gm-Message-State: AOJu0YxDfzOwqJ5/FvHbpvR+58Ou5DkZUZy0CfyGQsQ2a1pGEmLD6U5N
	ZRjqMknSmGuAORJRJXg4X9pW/qdVyjfFSgOZk0b1tdOmST/vzAhgv/mZGyXKXoODF90wvBBGjzf
	UUU/VnrR2EEXOK4avwtRS1RSpEH3vci0X5gRB//voPVr/7hjbuDs1Cw==
X-Received: by 2002:adf:edc2:0:b0:32d:a57b:8c8d with SMTP id v2-20020adfedc2000000b0032da57b8c8dmr12437998wro.69.1698238664533;
        Wed, 25 Oct 2023 05:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaI9gj2ovxx4sLpIcOCYpedqxIgHFi3Wcs69w/nw0GZB5lBOAnarl0/VEXOqC/394g7rDDa9Lg2WtTwOg2eIM=
X-Received: by 2002:adf:edc2:0:b0:32d:a57b:8c8d with SMTP id
 v2-20020adfedc2000000b0032da57b8c8dmr12437987wro.69.1698238664182; Wed, 25
 Oct 2023 05:57:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231025104212.12738-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20231025104212.12738-1-lukas.bulwahn@gmail.com>
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Wed, 25 Oct 2023 13:57:08 +0100
Message-ID: <CADWks+ZoLs1FUJx0sSg5FBYK5BtD+Po7bRORVT4uBLM6QJxXJQ@mail.gmail.com>
Subject: Re: [PATCH] docs: module-signing: adjust guide after sha1 and sha224
 support is gone
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, David Howells <dhowells@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
	Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 25 Oct 2023 at 11:42, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 16ab7cb5825f ("crypto: pkcs7 - remove sha1 support") and commit
> fc3225fd6f1e ("module: Do not offer sha224 for built-in module signing")
> removes sha1 and sha224 support for kernel module signing.
>
> Adjust the module-signing admin guide documentation to those changes.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Note I have submitted this change as part of the patch series that
adds SHA-3 over at
https://lore.kernel.org/linux-crypto/20231022182208.188714-1-dimitri.ledkov@canonical.com/T/#m81c32a65341a4de39596b72743ba38d46899016f

But indeed, if that patch series doesn't make it into the cryptodev
tree, then this documentation should go in, and the sha-3 one rebased
/ adjusted.

Sorry for not patching documentation at the same time as the code
changes that made documentation out of date.

Acked-by: Dimitri John ledkov <dimitri.ledkov@canonical.com>

> ---
>  Documentation/admin-guide/module-signing.rst | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
> index 2898b2703297..e3ea1def4c0c 100644
> --- a/Documentation/admin-guide/module-signing.rst
> +++ b/Documentation/admin-guide/module-signing.rst
> @@ -30,8 +30,8 @@ This facility uses X.509 ITU-T standard certificates to encode the public keys
>  involved.  The signatures are not themselves encoded in any industrial standard
>  type.  The facility currently only supports the RSA public key encryption
>  standard (though it is pluggable and permits others to be used).  The possible
> -hash algorithms that can be used are SHA-1, SHA-224, SHA-256, SHA-384, and
> -SHA-512 (the algorithm is selected by data in the signature).
> +hash algorithms that can be used are SHA-256, SHA-384, and SHA-512 (the
> +algorithm is selected by data in the signature).
>
>
>  ==========================
> @@ -81,8 +81,6 @@ This has a number of options available:
>       sign the modules with:
>
>          =============================== ==========================================
> -       ``CONFIG_MODULE_SIG_SHA1``      :menuselection:`Sign modules with SHA-1`
> -       ``CONFIG_MODULE_SIG_SHA224``    :menuselection:`Sign modules with SHA-224`
>         ``CONFIG_MODULE_SIG_SHA256``    :menuselection:`Sign modules with SHA-256`
>         ``CONFIG_MODULE_SIG_SHA384``    :menuselection:`Sign modules with SHA-384`
>         ``CONFIG_MODULE_SIG_SHA512``    :menuselection:`Sign modules with SHA-512`
> --
> 2.17.1
>


-- 
okurrr,

Dimitri

