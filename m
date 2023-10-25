Return-Path: <linux-doc+bounces-1122-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8727D72A0
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 19:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11991B2107B
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 17:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9D830F8D;
	Wed, 25 Oct 2023 17:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nadt9RxL"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12FF2D62F
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 17:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A26C433C8;
	Wed, 25 Oct 2023 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698256173;
	bh=CeyTBZs2xeQb0TaJ5m+PpCM8nU28HSwaY1ik5tYD5o0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nadt9RxLEqdHQTzPCvB13pBQ1Ju+RhH3NuQ+TT+dsOEsLlKYWgzWmdZbyM7HjHxsG
	 R7PqnTwS5jDxcU0LCHA15oW67sHKbxeTFWDFsZkNjS6wPoDme83JMnIAkPZg+iMOiG
	 gvM89z6zDpLOCUhfgShobVv5NtRtt4igElnNjJJ596qVQ+FJAdlCIlJVfWw15kw+fH
	 f5I8rbfwXSh5SoR2cWdwEa/TzVEJcmGZb6bAlUNACxoItcxlsz1b14qIJ0v05LDXT/
	 /IOHbguBYqKOkVKZvQ+XVSmfCas70j1oqYv3vTtDp6JapFQpKWQ/rNR8apP0znKWAp
	 pOMIzfudAr/HA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Oct 2023 20:49:24 +0300
Message-Id: <CWHPKFQIGWPM.B6IBLPXVBR1E@suppilovahvero>
Cc: "Shawn Guo" <shawnguo@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "NXP Linux
 Team" <linux-imx@nxp.com>, "Ahmad Fatoum" <a.fatoum@pengutronix.de>, "sigma
 star Kernel Team" <upstream+dcp@sigma-star.at>, "David Howells"
 <dhowells@redhat.com>, "Li Yang" <leoyang.li@nxp.com>, "Paul Moore"
 <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, "Tejun Heo" <tj@kernel.org>, "Steven Rostedt
 (Google)" <rostedt@goodmis.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-integrity@vger.kernel.org>,
 <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-security-module@vger.kernel.org>, "Richard Weinberger"
 <richard@nod.at>, "David Oberhollenzer" <david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH v4 2/5] KEYS: trusted: Introduce NXP DCP-backed trusted
 keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.15.2
References: <20231024162024.51260-1-david@sigma-star.at>
 <20231024162024.51260-3-david@sigma-star.at>
In-Reply-To: <20231024162024.51260-3-david@sigma-star.at>

On Tue Oct 24, 2023 at 7:20 PM EEST, David Gstir wrote:
> DCP (Data Co-Processor) is the little brother of NXP's CAAM IP.
> Beside of accelerated crypto operations, it also offers support for
> hardware-bound keys. Using this feature it is possible to implement a blo=
b
> mechanism similar to what CAAM offers. Unlike on CAAM, constructing and
> parsing the blob has to happen in software (i.e. the kernel).
>
> The software-based blob format used by DCP trusted keys encrypts
> the payload using AES-128-GCM with a freshly generated random key and non=
ce.
> The random key itself is AES-128-ECB encrypted using the DCP unique
> or OTP key.
>
> The DCP trusted key blob format is:
> /*
>  * struct dcp_blob_fmt - DCP BLOB format.
>  *
>  * @fmt_version: Format version, currently being %1
>  * @blob_key: Random AES 128 key which is used to encrypt @payload,
>  *            @blob_key itself is encrypted with OTP or UNIQUE device key=
 in
>  *            AES-128-ECB mode by DCP.
>  * @nonce: Random nonce used for @payload encryption.
>  * @payload_len: Length of the plain text @payload.
>  * @payload: The payload itself, encrypted using AES-128-GCM and @blob_ke=
y,
>  *           GCM auth tag of size AES_BLOCK_SIZE is attached at the end o=
f it.
>  *
>  * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + @payload=
_len +
>  * AES_BLOCK_SIZE.
>  */
> struct dcp_blob_fmt {
> 	__u8 fmt_version;
> 	__u8 blob_key[AES_KEYSIZE_128];
> 	__u8 nonce[AES_KEYSIZE_128];
> 	__le32 payload_len;
> 	__u8 payload[];
> } __packed;
>
> By default the unique key is used. It is also possible to use the
> OTP key. While the unique key should be unique it is not documented how
> this key is derived. Therefore selection the OTP key is supported as
> well via the use_otp_key module parameter.
>
> Co-developed-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Gstir <david@sigma-star.at>
> ---
>  include/keys/trusted_dcp.h                |  11 +
>  security/keys/trusted-keys/Kconfig        |   9 +-
>  security/keys/trusted-keys/Makefile       |   2 +
>  security/keys/trusted-keys/trusted_core.c |   6 +-
>  security/keys/trusted-keys/trusted_dcp.c  | 311 ++++++++++++++++++++++
>  5 files changed, 337 insertions(+), 2 deletions(-)
>  create mode 100644 include/keys/trusted_dcp.h
>  create mode 100644 security/keys/trusted-keys/trusted_dcp.c
>
> diff --git a/include/keys/trusted_dcp.h b/include/keys/trusted_dcp.h
> new file mode 100644
> index 000000000000..9aaa42075b40
> --- /dev/null
> +++ b/include/keys/trusted_dcp.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021 sigma star gmbh
> + */
> +
> +#ifndef TRUSTED_DCP_H
> +#define TRUSTED_DCP_H
> +
> +extern struct trusted_key_ops dcp_trusted_key_ops;
> +
> +#endif
> diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-k=
eys/Kconfig
> index dbfdd8536468..c6b80b7e5c78 100644
> --- a/security/keys/trusted-keys/Kconfig
> +++ b/security/keys/trusted-keys/Kconfig
> @@ -33,6 +33,13 @@ config TRUSTED_KEYS_CAAM
>  	  Enable use of NXP's Cryptographic Accelerator and Assurance Module
>  	  (CAAM) as trusted key backend.
> =20
> -if !TRUSTED_KEYS_TPM && !TRUSTED_KEYS_TEE && !TRUSTED_KEYS_CAAM
> +config TRUSTED_KEYS_DCP
> +	bool "DCP-based trusted keys"
> +	depends on CRYPTO_DEV_MXS_DCP >=3D TRUSTED_KEYS
> +	default y
> +	help
> +	  Enable use of NXP's DCP (Data Co-Processor) as trusted key backend.
> +
> +if !TRUSTED_KEYS_TPM && !TRUSTED_KEYS_TEE && !TRUSTED_KEYS_CAAM && !TRUS=
TED_KEYS_DCP

This does not scale tbh.

I'd suggest to add additional patch before adding the new key type,
which clears this up a little bit.

First:

config HAVE_TRUSTED_KEYS
	bool

And then following this pattern to all trusted key types:

config TRUSTED_KEYS_DCP
	bool "DCP-based trusted keys"
	depends on CRYPTO_DEV_MXS_DCP >=3D TRUSTED_KEYS
	default y
	select HAVE_TRUSTED_KEYS
	help
	  Enable use of NXP's DCP (Data Co-Processor) as trusted key backend.

And finally:

if !HAVE_TRUSTED_KEYS
	comment "No trust source selected!"
endif

BR, Jarkko

