Return-Path: <linux-doc+bounces-11772-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0761A87572F
	for <lists+linux-doc@lfdr.de>; Thu,  7 Mar 2024 20:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B2D31C203DA
	for <lists+linux-doc@lfdr.de>; Thu,  7 Mar 2024 19:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EAA13665B;
	Thu,  7 Mar 2024 19:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/xFY79D"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D911AACA;
	Thu,  7 Mar 2024 19:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709839833; cv=none; b=uU3wF4UrHkjNgj3LiRUFhARM0TiL2WbGmLKTnccEjVbWhn6qAIHCqcV3YLNVsKiNrkiiMOdw8eoh6naAZ21xWOR73yCqJZhSubW8mYiTZd43t7bQQzPnIxKapmHy9bCXJrOcN654lqS+PSe4d2xTVzBjyf41BjjWGBRC4ZRYYOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709839833; c=relaxed/simple;
	bh=e1RnfxVhzeQJFU4w6fYYaD7Hga9Gkw00dIdsYdCM/Yk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kOBPhace4EVReC4DjKKHjaoGYT2JHbmGy2gLqQolMCJIKqvrzx8GU/onXy8gmpHcvg4JAbY+TmtytXbYc1rwMYCWm+b4TS4Two9WCsTVZWBEns9eOhB9ELZwLHAzyCXQz0bT/UJjJZblyJg56jlb+gqvtN4hin59VzjysDzRvQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/xFY79D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934D4C433F1;
	Thu,  7 Mar 2024 19:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709839832;
	bh=e1RnfxVhzeQJFU4w6fYYaD7Hga9Gkw00dIdsYdCM/Yk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=T/xFY79DhNy2Ip9yEQSaBUOHEIRaToVN3OUGuNgegnPLxiUBMQRUfh8oYA6dm2/4k
	 IZCpNTv0TyQwJ5Bp298JpmhtfIuobTaQjMj5KVQ+jnZ9OJ54Z33cKQDZus+6vpnHAo
	 YeGtcADjvrdhu9Z/+UhxNPEe/I/Ozid6bdkaNdFJDEe8fhqh8Mbz+m3lyhzkLuuhy2
	 2lz0k7vqU66NhEqnnOKUGUY+rgQtoizsyp3QnJcb0sKxFOvKSC22J5tqMAomskBfTE
	 rNw9tvxraOXOWahDsLzwcs2vyzC5izkP+Xrh+BzId7xsbWzyMiLZzwfJCNr3DR6fUI
	 KRisHDWwqafzg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 Mar 2024 21:30:23 +0200
Message-Id: <CZNRMR5YZPQO.1QBLW62A6S840@kernel.org>
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
Subject: Re: [PATCH v6 3/6] KEYS: trusted: Introduce NXP DCP-backed trusted
 keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.17.0
References: <20240307153842.80033-1-david@sigma-star.at>
 <20240307153842.80033-4-david@sigma-star.at>
In-Reply-To: <20240307153842.80033-4-david@sigma-star.at>

On Thu Mar 7, 2024 at 5:38 PM EET, David Gstir wrote:
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
>  security/keys/trusted-keys/Kconfig        |   8 +
>  security/keys/trusted-keys/Makefile       |   2 +
>  security/keys/trusted-keys/trusted_core.c |   6 +-
>  security/keys/trusted-keys/trusted_dcp.c  | 309 ++++++++++++++++++++++
>  5 files changed, 335 insertions(+), 1 deletion(-)
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
> index 553dc117f385..1fb8aa001995 100644
> --- a/security/keys/trusted-keys/Kconfig
> +++ b/security/keys/trusted-keys/Kconfig
> @@ -39,6 +39,14 @@ config TRUSTED_KEYS_CAAM
>  	  Enable use of NXP's Cryptographic Accelerator and Assurance Module
>  	  (CAAM) as trusted key backend.
> =20
> +config TRUSTED_KEYS_DCP
> +	bool "DCP-based trusted keys"
> +	depends on CRYPTO_DEV_MXS_DCP >=3D TRUSTED_KEYS
> +	default y
> +	select HAVE_TRUSTED_KEYS
> +	help
> +	  Enable use of NXP's DCP (Data Co-Processor) as trusted key backend.
> +
>  if !HAVE_TRUSTED_KEYS
>  	comment "No trust source selected!"
>  endif
> diff --git a/security/keys/trusted-keys/Makefile b/security/keys/trusted-=
keys/Makefile
> index 735aa0bc08ef..f0f3b27f688b 100644
> --- a/security/keys/trusted-keys/Makefile
> +++ b/security/keys/trusted-keys/Makefile
> @@ -14,3 +14,5 @@ trusted-$(CONFIG_TRUSTED_KEYS_TPM) +=3D tpm2key.asn1.o
>  trusted-$(CONFIG_TRUSTED_KEYS_TEE) +=3D trusted_tee.o
> =20
>  trusted-$(CONFIG_TRUSTED_KEYS_CAAM) +=3D trusted_caam.o
> +
> +trusted-$(CONFIG_TRUSTED_KEYS_DCP) +=3D trusted_dcp.o
> diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/tr=
usted-keys/trusted_core.c
> index fee1ab2c734d..5113aeae5628 100644
> --- a/security/keys/trusted-keys/trusted_core.c
> +++ b/security/keys/trusted-keys/trusted_core.c
> @@ -10,6 +10,7 @@
>  #include <keys/trusted-type.h>
>  #include <keys/trusted_tee.h>
>  #include <keys/trusted_caam.h>
> +#include <keys/trusted_dcp.h>
>  #include <keys/trusted_tpm.h>
>  #include <linux/capability.h>
>  #include <linux/err.h>
> @@ -30,7 +31,7 @@ MODULE_PARM_DESC(rng, "Select trusted key RNG");
> =20
>  static char *trusted_key_source;
>  module_param_named(source, trusted_key_source, charp, 0);
> -MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee or caam)"=
);
> +MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam or =
dcp)");
> =20
>  static const struct trusted_key_source trusted_key_sources[] =3D {
>  #if defined(CONFIG_TRUSTED_KEYS_TPM)
> @@ -42,6 +43,9 @@ static const struct trusted_key_source trusted_key_sour=
ces[] =3D {
>  #if defined(CONFIG_TRUSTED_KEYS_CAAM)
>  	{ "caam", &trusted_key_caam_ops },
>  #endif
> +#if defined(CONFIG_TRUSTED_KEYS_DCP)
> +	{ "dcp", &dcp_trusted_key_ops },
> +#endif
>  };
> =20
>  DEFINE_STATIC_CALL_NULL(trusted_key_seal, *trusted_key_sources[0].ops->s=
eal);
> diff --git a/security/keys/trusted-keys/trusted_dcp.c b/security/keys/tru=
sted-keys/trusted_dcp.c
> new file mode 100644
> index 000000000000..4addf0970590
> --- /dev/null
> +++ b/security/keys/trusted-keys/trusted_dcp.c
> @@ -0,0 +1,309 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021 sigma star gmbh
> + */
> +
> +#include <crypto/aead.h>
> +#include <crypto/aes.h>
> +#include <crypto/algapi.h>
> +#include <crypto/gcm.h>
> +#include <crypto/skcipher.h>
> +#include <keys/trusted-type.h>
> +#include <linux/key-type.h>
> +#include <linux/module.h>
> +#include <linux/printk.h>
> +#include <linux/random.h>
> +#include <linux/scatterlist.h>
> +#include <soc/fsl/dcp.h>
> +
> +#define DCP_BLOB_VERSION 1
> +#define DCP_BLOB_AUTHLEN 16
> +
> +/**
> + * struct dcp_blob_fmt - DCP BLOB format.
> + *
> + * @fmt_version: Format version, currently being %1.
> + * @blob_key: Random AES 128 key which is used to encrypt @payload,
> + *            @blob_key itself is encrypted with OTP or UNIQUE device ke=
y in
> + *            AES-128-ECB mode by DCP.
> + * @nonce: Random nonce used for @payload encryption.
> + * @payload_len: Length of the plain text @payload.
> + * @payload: The payload itself, encrypted using AES-128-GCM and @blob_k=
ey,
> + *           GCM auth tag of size DCP_BLOB_AUTHLEN is attached at the en=
d of it.
> + *
> + * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + @payloa=
d_len +
> + * DCP_BLOB_AUTHLEN.
> + */
> +struct dcp_blob_fmt {
> +	__u8 fmt_version;
> +	__u8 blob_key[AES_KEYSIZE_128];
> +	__u8 nonce[AES_KEYSIZE_128];
> +	__le32 payload_len;
> +	__u8 payload[];
> +} __packed;
> +
> +static bool use_otp_key;
> +module_param_named(dcp_use_otp_key, use_otp_key, bool, 0);
> +MODULE_PARM_DESC(dcp_use_otp_key, "Use OTP instead of UNIQUE key for sea=
ling");
> +
> +static bool skip_zk_test;
> +module_param_named(dcp_skip_zk_test, skip_zk_test, bool, 0);
> +MODULE_PARM_DESC(dcp_skip_zk_test, "Don't test whether device keys are z=
ero'ed");
> +
> +static unsigned int calc_blob_len(unsigned int payload_len)
> +{
> +	return sizeof(struct dcp_blob_fmt) + payload_len + DCP_BLOB_AUTHLEN;
> +}
> +
> +static int do_dcp_crypto(u8 *in, u8 *out, bool do_encrypt)
> +{
> +	struct skcipher_request *req =3D NULL;
> +	struct scatterlist src_sg, dst_sg;
> +	struct crypto_skcipher *tfm;
> +	u8 paes_key[DCP_PAES_KEYSIZE];
> +	DECLARE_CRYPTO_WAIT(wait);
> +	int res =3D 0;
> +
> +	if (use_otp_key)
> +		paes_key[0] =3D DCP_PAES_KEY_OTP;
> +	else
> +		paes_key[0] =3D DCP_PAES_KEY_UNIQUE;
> +
> +	tfm =3D crypto_alloc_skcipher("ecb-paes-dcp", CRYPTO_ALG_INTERNAL,
> +				    CRYPTO_ALG_INTERNAL);
> +	if (IS_ERR(tfm)) {
> +		res =3D PTR_ERR(tfm);
> +		tfm =3D NULL;
> +		goto out;
> +	}
> +
> +	req =3D skcipher_request_alloc(tfm, GFP_NOFS);
> +	if (!req) {
> +		res =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	skcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG |
> +				      CRYPTO_TFM_REQ_MAY_SLEEP,
> +				      crypto_req_done, &wait);
> +	res =3D crypto_skcipher_setkey(tfm, paes_key, sizeof(paes_key));
> +	if (res < 0)
> +		goto out;
> +
> +	sg_init_one(&src_sg, in, AES_KEYSIZE_128);
> +	sg_init_one(&dst_sg, out, AES_KEYSIZE_128);
> +	skcipher_request_set_crypt(req, &src_sg, &dst_sg, AES_KEYSIZE_128,
> +				   NULL);
> +
> +	if (do_encrypt)
> +		res =3D crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
> +	else
> +		res =3D crypto_wait_req(crypto_skcipher_decrypt(req), &wait);
> +
> +out:
> +	skcipher_request_free(req);
> +	crypto_free_skcipher(tfm);
> +
> +	return res;
> +}
> +
> +static int do_aead_crypto(u8 *in, u8 *out, size_t len, u8 *key, u8 *nonc=
e,
> +			  bool do_encrypt)
> +{
> +	struct aead_request *aead_req =3D NULL;
> +	struct scatterlist src_sg, dst_sg;
> +	struct crypto_aead *aead;
> +	int ret;
> +
> +	aead =3D crypto_alloc_aead("gcm(aes)", 0, CRYPTO_ALG_ASYNC);
> +	if (IS_ERR(aead)) {
> +		ret =3D PTR_ERR(aead);
> +		goto out;
> +	}
> +
> +	ret =3D crypto_aead_setauthsize(aead, DCP_BLOB_AUTHLEN);
> +	if (ret < 0) {
> +		pr_err("Can't set crypto auth tag len: %d\n", ret);
> +		goto free_aead;
> +	}
> +
> +	aead_req =3D aead_request_alloc(aead, GFP_KERNEL);
> +	if (!aead_req) {
> +		ret =3D -ENOMEM;
> +		goto free_aead;
> +	}
> +
> +	sg_init_one(&src_sg, in, len);
> +	if (do_encrypt) {
> +		/*
> +		 * If we encrypt our buffer has extra space for the auth tag.
> +		 */
> +		sg_init_one(&dst_sg, out, len + DCP_BLOB_AUTHLEN);
> +	} else {
> +		sg_init_one(&dst_sg, out, len);
> +	}
> +
> +	aead_request_set_crypt(aead_req, &src_sg, &dst_sg, len, nonce);
> +	aead_request_set_callback(aead_req, CRYPTO_TFM_REQ_MAY_SLEEP, NULL,
> +				  NULL);
> +	aead_request_set_ad(aead_req, 0);
> +
> +	if (crypto_aead_setkey(aead, key, AES_KEYSIZE_128)) {
> +		pr_err("Can't set crypto AEAD key\n");
> +		ret =3D -EINVAL;
> +		goto free_req;
> +	}
> +
> +	if (do_encrypt)
> +		ret =3D crypto_aead_encrypt(aead_req);
> +	else
> +		ret =3D crypto_aead_decrypt(aead_req);
> +
> +free_req:
> +	aead_request_free(aead_req);
> +free_aead:
> +	crypto_free_aead(aead);
> +out:
> +	return ret;
> +}
> +
> +static int decrypt_blob_key(u8 *key)
> +{
> +	return do_dcp_crypto(key, key, false);
> +}
> +
> +static int encrypt_blob_key(u8 *key)
> +{
> +	return do_dcp_crypto(key, key, true);
> +}
> +
> +static int trusted_dcp_seal(struct trusted_key_payload *p, char *datablo=
b)
> +{
> +	struct dcp_blob_fmt *b =3D (struct dcp_blob_fmt *)p->blob;
> +	int blen, ret;
> +
> +	blen =3D calc_blob_len(p->key_len);
> +	if (blen > MAX_BLOB_SIZE)
> +		return -E2BIG;
> +
> +	b->fmt_version =3D DCP_BLOB_VERSION;
> +	get_random_bytes(b->nonce, AES_KEYSIZE_128);
> +	get_random_bytes(b->blob_key, AES_KEYSIZE_128);
> +
> +	ret =3D do_aead_crypto(p->key, b->payload, p->key_len, b->blob_key,
> +			     b->nonce, true);
> +	if (ret) {
> +		pr_err("Unable to encrypt blob payload: %i\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D encrypt_blob_key(b->blob_key);
> +	if (ret) {
> +		pr_err("Unable to encrypt blob key: %i\n", ret);
> +		return ret;
> +	}
> +
> +	b->payload_len =3D get_unaligned_le32(&p->key_len);
> +	p->blob_len =3D blen;
> +	return 0;
> +}
> +
> +static int trusted_dcp_unseal(struct trusted_key_payload *p, char *datab=
lob)
> +{
> +	struct dcp_blob_fmt *b =3D (struct dcp_blob_fmt *)p->blob;
> +	int blen, ret;
> +
> +	if (b->fmt_version !=3D DCP_BLOB_VERSION) {
> +		pr_err("DCP blob has bad version: %i, expected %i\n",
> +		       b->fmt_version, DCP_BLOB_VERSION);
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	p->key_len =3D le32_to_cpu(b->payload_len);
> +	blen =3D calc_blob_len(p->key_len);
> +	if (blen !=3D p->blob_len) {
> +		pr_err("DCP blob has bad length: %i !=3D %i\n", blen,
> +		       p->blob_len);
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	ret =3D decrypt_blob_key(b->blob_key);
> +	if (ret) {
> +		pr_err("Unable to decrypt blob key: %i\n", ret);
> +		goto out;
> +	}
> +
> +	ret =3D do_aead_crypto(b->payload, p->key, p->key_len + DCP_BLOB_AUTHLE=
N,
> +			     b->blob_key, b->nonce, false);
> +	if (ret) {
> +		pr_err("Unwrap of DCP payload failed: %i\n", ret);
> +		goto out;
> +	}
> +
> +	ret =3D 0;
> +out:
> +	return ret;
> +}
> +
> +static int test_for_zero_key(void)
> +{
> +	static const u8 bad[] =3D {0x9a, 0xda, 0xe0, 0x54, 0xf6, 0x3d, 0xfa, 0x=
ff,
> +				 0x5e, 0xa1, 0x8e, 0x45, 0xed, 0xf6, 0xea, 0x6f};
=20
 nit: inline comment about 'bad'.

> +	void *buf =3D NULL;
> +	int ret =3D 0;
> +
> +	if (skip_zk_test)
> +		goto out;
> +
> +	buf =3D kmalloc(AES_BLOCK_SIZE, GFP_KERNEL);
> +	if (!buf) {
> +		ret =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	memset(buf, 0x55, AES_BLOCK_SIZE);
> +
> +	ret =3D do_dcp_crypto(buf, buf, true);
> +	if (ret)
> +		goto out;
> +
> +	if (memcmp(buf, bad, AES_BLOCK_SIZE) =3D=3D 0) {
> +		pr_err("Device neither in secure nor trusted mode!\n");
> +		ret =3D -EINVAL;
> +	}
> +out:
> +	kfree(buf);
> +	return ret;
> +}
> +
> +static int trusted_dcp_init(void)
> +{
> +	int ret;
> +
> +	if (use_otp_key)
> +		pr_info("Using DCP OTP key\n");
> +
> +	ret =3D test_for_zero_key();
> +	if (ret) {
> +		pr_err("Test for zero'ed keys failed: %i\n", ret);

I'm not sure whether this should err or warn.

What sort of situations can cause the test the fail (e.g.
adversary/interposer, bad configuration etc.).

BR, Jarkko

