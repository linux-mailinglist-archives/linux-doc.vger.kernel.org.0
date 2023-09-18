Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDD37A4BB7
	for <lists+linux-doc@lfdr.de>; Mon, 18 Sep 2023 17:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236143AbjIRPVW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Sep 2023 11:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236030AbjIRPVT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Sep 2023 11:21:19 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9D619A6
        for <linux-doc@vger.kernel.org>; Mon, 18 Sep 2023 08:18:15 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31fe3426a61so3768749f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Sep 2023 08:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1695050294; x=1695655094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9BlGz3qCp3ihQBmoP998iBDhoGBlremsEFBMozEXZI=;
        b=rb+YpJQdcrIBK4hgyzvi5xk4ARJ+A3anOd7ow4xca1r1V9WU/PZu64X9OFHVxihmH7
         qlaZ1sW5TuNRceonqw3/OMMaUs13EnA0mFtzpAQpTajK1RNTcHYNTGpo3DqxgsRpV/sB
         vwt0pb0omxjr9dIrngaRSTV/e1dqCUBkK7mbMdSydLt76cHOXg6nvQ2d6d/crcFvtOUn
         6CNaW1NmJB9KklIFdqHa8+2KZRwBFOAg1p6y4KZizJP/mwcxPY+oti9VO0eG4FKN59+A
         w9JkILETq5I4XtWSB5HSDUX3vlqo03vVP/fK4IhgCjzWiQQ4JZKC9Z18rGWzecQpy/gG
         kcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050294; x=1695655094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9BlGz3qCp3ihQBmoP998iBDhoGBlremsEFBMozEXZI=;
        b=XmmropGZxc+wD6QOh5okaQeNCp13VbkFgvD7mQsWszZU77b4OO78Q3+VwGNEYDO0a6
         6EV0eu/MSQ3Aa2gJmiHLHlYImQoIS2gt9N+/heQFFcc0o4HEp51AFegir5pGKocpMQdP
         qS3D3asBktXoeK4tQH9MwWxsi32oi/f1KkRHDkWweMU+jI2gztEnzbKCTDGQMpqdBEsW
         kfOgk/cYKQu3X6WLYnCKxpLyTZBePgHZq97CRE1wtjAnTTlMwLQwpIS3MF3s4gWqtuER
         4BML5G0L9NzJT918wBYYbhVeSMK+XoaTFGo1baF+/WiTLbB2EILElIKM/GGrP2RaJMHn
         zgsg==
X-Gm-Message-State: AOJu0YzUktidTic3X00bNvE9YjK/YgCoBLqFBjTcl/ZEK46TBdonz+ZF
        4dYjVLBgI8ppc5OXjH6AEqJa6Pm9yTJiBEpjpcHX5g==
X-Google-Smtp-Source: AGHT+IFTq04S1U7+RcR39a+EsEzdR1VMXAgYk0b87qrajRa9J5KYAAO+8WT10iy3a/xq7soTWQam4w==
X-Received: by 2002:a17:906:101b:b0:99b:4ed4:5527 with SMTP id 27-20020a170906101b00b0099b4ed45527mr7642795ejm.25.1695046720138;
        Mon, 18 Sep 2023 07:18:40 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id i13-20020a170906114d00b00992afee724bsm6408405eja.76.2023.09.18.07.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 07:18:39 -0700 (PDT)
From:   David Gstir <david@sigma-star.at>
To:     Mimi Zohar <zohar@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     David Gstir <david@sigma-star.at>, Shawn Guo <shawnguo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        sigma star Kernel Team <upstream+dcp@sigma-star.at>,
        David Howells <dhowells@redhat.com>,
        Li Yang <leoyang.li@nxp.com>, Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Tejun Heo <tj@kernel.org>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-security-module@vger.kernel.org,
        Richard Weinberger <richard@nod.at>,
        David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v3 2/3] KEYS: trusted: Introduce support for NXP DCP-based trusted keys
Date:   Mon, 18 Sep 2023 16:18:24 +0200
Message-ID: <20230918141826.8139-3-david@sigma-star.at>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230918141826.8139-1-david@sigma-star.at>
References: <20230918141826.8139-1-david@sigma-star.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

DCP (Data Co-Processor) is the little brother of NXP's CAAM IP.

Beside of accelerated crypto operations, it also offers support for
hardware-bound keys. Using this feature it is possible to implement a blob
mechanism just like CAAM offers. Unlike on CAAM, constructing and
parsing the blob has to happen in software.

We chose the following format for the blob:
/*
 * struct dcp_blob_fmt - DCP BLOB format.
 *
 * @fmt_version: Format version, currently being %1
 * @blob_key: Random AES 128 key which is used to encrypt @payload,
 *            @blob_key itself is encrypted with OTP or UNIQUE device key in
 *            AES-128-ECB mode by DCP.
 * @nonce: Random nonce used for @payload encryption.
 * @payload_len: Length of the plain text @payload.
 * @payload: The payload itself, encrypted using AES-128-GCM and @blob_key,
 *           GCM auth tag of size AES_BLOCK_SIZE is attached at the end of it.
 *
 * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + @payload_len +
 * AES_BLOCK_SIZE.
 */
struct dcp_blob_fmt {
	__u8 fmt_version;
	__u8 blob_key[AES_KEYSIZE_128];
	__u8 nonce[AES_KEYSIZE_128];
	__le32 payload_len;
	__u8 payload[];
} __packed;

@payload is the key provided by trusted_key_ops->seal().

By default the UNIQUE device key is used, it is also possible to use
the OTP key. While the UNIQUE device key should be unique it is not
entirely clear whether this is the case due to unclear documentation.
If someone wants to be sure they can burn their own unique key
into the OTP fuse and set the use_otp_key module parameter.

Co-developed-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Gstir <david@sigma-star.at>
---
 .../admin-guide/kernel-parameters.txt         |  13 +
 MAINTAINERS                                   |   9 +
 include/keys/trusted_dcp.h                    |  11 +
 security/keys/trusted-keys/Kconfig            |   9 +-
 security/keys/trusted-keys/Makefile           |   2 +
 security/keys/trusted-keys/trusted_core.c     |   6 +-
 security/keys/trusted-keys/trusted_dcp.c      | 311 ++++++++++++++++++
 7 files changed, 359 insertions(+), 2 deletions(-)
 create mode 100644 include/keys/trusted_dcp.h
 create mode 100644 security/keys/trusted-keys/trusted_dcp.c

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0a1731a0f0ef..c11eda8b38e0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6566,6 +6566,7 @@
 			- "tpm"
 			- "tee"
 			- "caam"
+			- "dcp"
 			If not specified then it defaults to iterating through
 			the trust source list starting with TPM and assigns the
 			first trust source as a backend which is initialized
@@ -6581,6 +6582,18 @@
 			If not specified, "default" is used. In this case,
 			the RNG's choice is left to each individual trust source.
 
+	trusted.dcp_use_otp_key
+			This is intended to be used in combination with
+			trusted.source=dcp and will select the DCP OTP key
+			instead of the DCP UNIQUE key blob encryption.
+
+	trusted.dcp_skip_zk_test
+			This is intended to be used in combination with
+			trusted.source=dcp and will disable the check if all
+			the blob key is zero'ed. This is helpful for situations where
+			having this key zero'ed is acceptable. E.g. in testing
+			scenarios.
+
 	tsc=		Disable clocksource stability checks for TSC.
 			Format: <string>
 			[x86] reliable: mark tsc clocksource as reliable, this
diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..988d01226131 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11647,6 +11647,15 @@ S:	Maintained
 F:	include/keys/trusted_caam.h
 F:	security/keys/trusted-keys/trusted_caam.c
 
+KEYS-TRUSTED-DCP
+M:	David Gstir <david@sigma-star.at>
+R:	sigma star Kernel Team <upstream+dcp@sigma-star.at>
+L:	linux-integrity@vger.kernel.org
+L:	keyrings@vger.kernel.org
+S:	Supported
+F:	include/keys/trusted_dcp.h
+F:	security/keys/trusted-keys/trusted_dcp.c
+
 KEYS-TRUSTED-TEE
 M:	Sumit Garg <sumit.garg@linaro.org>
 L:	linux-integrity@vger.kernel.org
diff --git a/include/keys/trusted_dcp.h b/include/keys/trusted_dcp.h
new file mode 100644
index 000000000000..9aaa42075b40
--- /dev/null
+++ b/include/keys/trusted_dcp.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 sigma star gmbh
+ */
+
+#ifndef TRUSTED_DCP_H
+#define TRUSTED_DCP_H
+
+extern struct trusted_key_ops dcp_trusted_key_ops;
+
+#endif
diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-keys/Kconfig
index dbfdd8536468..c6b80b7e5c78 100644
--- a/security/keys/trusted-keys/Kconfig
+++ b/security/keys/trusted-keys/Kconfig
@@ -33,6 +33,13 @@ config TRUSTED_KEYS_CAAM
 	  Enable use of NXP's Cryptographic Accelerator and Assurance Module
 	  (CAAM) as trusted key backend.
 
-if !TRUSTED_KEYS_TPM && !TRUSTED_KEYS_TEE && !TRUSTED_KEYS_CAAM
+config TRUSTED_KEYS_DCP
+	bool "DCP-based trusted keys"
+	depends on CRYPTO_DEV_MXS_DCP >= TRUSTED_KEYS
+	default y
+	help
+	  Enable use of NXP's DCP (Data Co-Processor) as trusted key backend.
+
+if !TRUSTED_KEYS_TPM && !TRUSTED_KEYS_TEE && !TRUSTED_KEYS_CAAM && !TRUSTED_KEYS_DCP
 comment "No trust source selected!"
 endif
diff --git a/security/keys/trusted-keys/Makefile b/security/keys/trusted-keys/Makefile
index 735aa0bc08ef..f0f3b27f688b 100644
--- a/security/keys/trusted-keys/Makefile
+++ b/security/keys/trusted-keys/Makefile
@@ -14,3 +14,5 @@ trusted-$(CONFIG_TRUSTED_KEYS_TPM) += tpm2key.asn1.o
 trusted-$(CONFIG_TRUSTED_KEYS_TEE) += trusted_tee.o
 
 trusted-$(CONFIG_TRUSTED_KEYS_CAAM) += trusted_caam.o
+
+trusted-$(CONFIG_TRUSTED_KEYS_DCP) += trusted_dcp.o
diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/trusted-keys/trusted_core.c
index c6fc50d67214..8af0988be850 100644
--- a/security/keys/trusted-keys/trusted_core.c
+++ b/security/keys/trusted-keys/trusted_core.c
@@ -10,6 +10,7 @@
 #include <keys/trusted-type.h>
 #include <keys/trusted_tee.h>
 #include <keys/trusted_caam.h>
+#include <keys/trusted_dcp.h>
 #include <keys/trusted_tpm.h>
 #include <linux/capability.h>
 #include <linux/err.h>
@@ -30,7 +31,7 @@ MODULE_PARM_DESC(rng, "Select trusted key RNG");
 
 static char *trusted_key_source;
 module_param_named(source, trusted_key_source, charp, 0);
-MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee or caam)");
+MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam or dcp)");
 
 static const struct trusted_key_source trusted_key_sources[] = {
 #if defined(CONFIG_TRUSTED_KEYS_TPM)
@@ -42,6 +43,9 @@ static const struct trusted_key_source trusted_key_sources[] = {
 #if defined(CONFIG_TRUSTED_KEYS_CAAM)
 	{ "caam", &trusted_key_caam_ops },
 #endif
+#if defined(CONFIG_TRUSTED_KEYS_DCP)
+	{ "dcp", &dcp_trusted_key_ops },
+#endif
 };
 
 DEFINE_STATIC_CALL_NULL(trusted_key_init, *trusted_key_sources[0].ops->init);
diff --git a/security/keys/trusted-keys/trusted_dcp.c b/security/keys/trusted-keys/trusted_dcp.c
new file mode 100644
index 000000000000..8d19b92fe976
--- /dev/null
+++ b/security/keys/trusted-keys/trusted_dcp.c
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 sigma star gmbh
+ */
+
+#include <crypto/aead.h>
+#include <crypto/aes.h>
+#include <crypto/algapi.h>
+#include <crypto/gcm.h>
+#include <crypto/skcipher.h>
+#include <keys/trusted-type.h>
+#include <linux/key-type.h>
+#include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/random.h>
+#include <linux/scatterlist.h>
+#include <soc/fsl/dcp.h>
+
+#define DCP_BLOB_VERSION 1
+#define DCP_BLOB_AUTHLEN 16
+
+/**
+ * struct dcp_blob_fmt - DCP BLOB format.
+ *
+ * @fmt_version: Format version, currently being %1.
+ * @blob_key: Random AES 128 key which is used to encrypt @payload,
+ *            @blob_key itself is encrypted with OTP or UNIQUE device key in
+ *            AES-128-ECB mode by DCP.
+ * @nonce: Random nonce used for @payload encryption.
+ * @payload_len: Length of the plain text @payload.
+ * @payload: The payload itself, encrypted using AES-128-GCM and @blob_key,
+ *           GCM auth tag of size DCP_BLOB_AUTHLEN is attached at the end of it.
+ *
+ * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + @payload_len +
+ * DCP_BLOB_AUTHLEN.
+ */
+struct dcp_blob_fmt {
+	__u8 fmt_version;
+	__u8 blob_key[AES_KEYSIZE_128];
+	__u8 nonce[AES_KEYSIZE_128];
+	__le32 payload_len;
+	__u8 payload[];
+} __packed;
+
+static bool use_otp_key;
+module_param_named(dcp_use_otp_key, use_otp_key, bool, 0);
+MODULE_PARM_DESC(dcp_use_otp_key, "Use OTP instead of UNIQUE key for sealing");
+
+static bool skip_zk_test;
+module_param_named(dcp_skip_zk_test, skip_zk_test, bool, 0);
+MODULE_PARM_DESC(dcp_skip_zk_test, "Don't test whether device keys are zero'ed");
+
+static unsigned int calc_blob_len(unsigned int payload_len)
+{
+	return sizeof(struct dcp_blob_fmt) + payload_len + DCP_BLOB_AUTHLEN;
+}
+
+static int do_dcp_crypto(u8 *in, u8 *out, bool is_encrypt)
+{
+	int res = 0;
+	struct skcipher_request *req = NULL;
+	DECLARE_CRYPTO_WAIT(wait);
+	struct scatterlist src_sg, dst_sg;
+	struct crypto_skcipher *tfm;
+	u8 paes_key[DCP_PAES_KEYSIZE];
+
+	if (use_otp_key)
+		paes_key[0] = DCP_PAES_KEY_OTP;
+	else
+		paes_key[0] = DCP_PAES_KEY_UNIQUE;
+
+	tfm = crypto_alloc_skcipher("ecb-paes-dcp", CRYPTO_ALG_INTERNAL,
+				    CRYPTO_ALG_INTERNAL);
+	if (IS_ERR(tfm)) {
+		res = PTR_ERR(tfm);
+		pr_err("Unable to request DCP pAES-ECB cipher: %i\n", res);
+		tfm = NULL;
+		goto out;
+	}
+
+	req = skcipher_request_alloc(tfm, GFP_NOFS);
+	if (!req) {
+		res = -ENOMEM;
+		goto out;
+	}
+
+	skcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG |
+				      CRYPTO_TFM_REQ_MAY_SLEEP,
+				      crypto_req_done, &wait);
+	res = crypto_skcipher_setkey(tfm, paes_key, sizeof(paes_key));
+	if (res < 0)
+		goto out;
+
+	sg_init_one(&src_sg, in, AES_KEYSIZE_128);
+	sg_init_one(&dst_sg, out, AES_KEYSIZE_128);
+	skcipher_request_set_crypt(req, &src_sg, &dst_sg, AES_KEYSIZE_128,
+				   NULL);
+
+	if (is_encrypt)
+		res = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
+	else
+		res = crypto_wait_req(crypto_skcipher_decrypt(req), &wait);
+
+out:
+	skcipher_request_free(req);
+	crypto_free_skcipher(tfm);
+
+	return res;
+}
+
+static int do_aead_crypto(u8 *in, u8 *out, size_t len, u8 *key, u8 *nonce,
+			  bool is_encrypt)
+{
+	struct aead_request *aead_req = NULL;
+	struct scatterlist src_sg, dst_sg;
+	struct crypto_aead *aead;
+	int ret;
+
+	aead = crypto_alloc_aead("gcm(aes)", 0, CRYPTO_ALG_ASYNC);
+	if (IS_ERR(aead)) {
+		ret = PTR_ERR(aead);
+		pr_err("Unable to request AES-GCM cipher: %i\n", ret);
+		goto out;
+	}
+
+	ret = crypto_aead_setauthsize(aead, DCP_BLOB_AUTHLEN);
+	if (ret < 0) {
+		pr_err("Can't set crypto auth tag len: %d\n", ret);
+		goto free_aead;
+	}
+
+	aead_req = aead_request_alloc(aead, GFP_KERNEL);
+	if (!aead_req) {
+		ret = -ENOMEM;
+		goto free_aead;
+	}
+
+	sg_init_one(&src_sg, in, len);
+	if (is_encrypt) {
+		/*
+		 * If we encrypt our buffer has extra space for the auth tag.
+		 */
+		sg_init_one(&dst_sg, out, len + DCP_BLOB_AUTHLEN);
+	} else {
+		sg_init_one(&dst_sg, out, len);
+	}
+
+	aead_request_set_crypt(aead_req, &src_sg, &dst_sg, len, nonce);
+	aead_request_set_callback(aead_req, CRYPTO_TFM_REQ_MAY_SLEEP, NULL,
+				  NULL);
+	aead_request_set_ad(aead_req, 0);
+
+	if (crypto_aead_setkey(aead, key, AES_KEYSIZE_128)) {
+		pr_err("Can't set crypto AEAD key\n");
+		ret = -EINVAL;
+		goto free_req;
+	}
+
+	if (is_encrypt)
+		ret = crypto_aead_encrypt(aead_req);
+	else
+		ret = crypto_aead_decrypt(aead_req);
+
+free_req:
+	aead_request_free(aead_req);
+free_aead:
+	crypto_free_aead(aead);
+out:
+	return ret;
+}
+
+static int decrypt_blob_key(u8 *key)
+{
+	return do_dcp_crypto(key, key, false);
+}
+
+static int encrypt_blob_key(u8 *key)
+{
+	return do_dcp_crypto(key, key, true);
+}
+
+static int trusted_dcp_seal(struct trusted_key_payload *p, char *datablob)
+{
+	struct dcp_blob_fmt *b = (struct dcp_blob_fmt *)p->blob;
+	int blen, ret;
+
+	blen = calc_blob_len(p->key_len);
+	if (blen > MAX_BLOB_SIZE)
+		return -E2BIG;
+
+	b->fmt_version = DCP_BLOB_VERSION;
+	get_random_bytes(b->nonce, AES_KEYSIZE_128);
+	get_random_bytes(b->blob_key, AES_KEYSIZE_128);
+
+	ret = do_aead_crypto(p->key, b->payload, p->key_len, b->blob_key,
+			     b->nonce, true);
+	if (ret) {
+		pr_err("Unable to encrypt blob payload: %i\n", ret);
+		return ret;
+	}
+
+	ret = encrypt_blob_key(b->blob_key);
+	if (ret) {
+		pr_err("Unable to encrypt blob key: %i\n", ret);
+		return ret;
+	}
+
+	b->payload_len = get_unaligned_le32(&p->key_len);
+	p->blob_len = blen;
+	return 0;
+}
+
+static int trusted_dcp_unseal(struct trusted_key_payload *p, char *datablob)
+{
+	struct dcp_blob_fmt *b = (struct dcp_blob_fmt *)p->blob;
+	int blen, ret;
+
+	if (b->fmt_version != DCP_BLOB_VERSION) {
+		pr_err("DCP blob has bad version: %i, expected %i\n",
+		       b->fmt_version, DCP_BLOB_VERSION);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	p->key_len = le32_to_cpu(b->payload_len);
+	blen = calc_blob_len(p->key_len);
+	if (blen != p->blob_len) {
+		pr_err("DCP blob has bad length: %i != %i\n", blen,
+		       p->blob_len);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = decrypt_blob_key(b->blob_key);
+	if (ret) {
+		pr_err("Unable to decrypt blob key: %i\n", ret);
+		goto out;
+	}
+
+	ret = do_aead_crypto(b->payload, p->key, p->key_len + DCP_BLOB_AUTHLEN,
+			     b->blob_key, b->nonce, false);
+	if (ret) {
+		pr_err("Unwrap of DCP payload failed: %i\n", ret);
+		goto out;
+	}
+
+	ret = 0;
+out:
+	return ret;
+}
+
+static int test_for_zero_key(void)
+{
+	static const u8 bad[] = {0x9a, 0xda, 0xe0, 0x54, 0xf6, 0x3d, 0xfa, 0xff,
+				 0x5e, 0xa1, 0x8e, 0x45, 0xed, 0xf6, 0xea, 0x6f};
+	void *buf = NULL;
+	int ret = 0;
+
+	if (skip_zk_test)
+		goto out;
+
+	buf = kmalloc(AES_BLOCK_SIZE, GFP_KERNEL);
+	if (!buf) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	memset(buf, 0x55, AES_BLOCK_SIZE);
+
+	ret = do_dcp_crypto(buf, buf, true);
+	if (ret)
+		goto out;
+
+	if (memcmp(buf, bad, AES_BLOCK_SIZE) == 0) {
+		pr_err("Device neither in secure nor trusted mode!\n");
+		ret = -EINVAL;
+	}
+out:
+	kfree(buf);
+	return ret;
+}
+
+static int trusted_dcp_init(void)
+{
+	int ret;
+
+	if (use_otp_key)
+		pr_info("Using DCP OTP key\n");
+
+	ret = test_for_zero_key();
+	if (ret) {
+		pr_err("Test for zero'ed keys failed: %i\n", ret);
+
+		return -EINVAL;
+	}
+
+	return register_key_type(&key_type_trusted);
+}
+
+static void trusted_dcp_exit(void)
+{
+	unregister_key_type(&key_type_trusted);
+}
+
+struct trusted_key_ops dcp_trusted_key_ops = {
+	.exit = trusted_dcp_exit,
+	.init = trusted_dcp_init,
+	.seal = trusted_dcp_seal,
+	.unseal = trusted_dcp_unseal,
+	.migratable = 0,
+};
-- 
2.35.3

