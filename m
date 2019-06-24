Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8F9051BB3
	for <lists+linux-doc@lfdr.de>; Mon, 24 Jun 2019 21:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbfFXTw1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 24 Jun 2019 15:52:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41944 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727529AbfFXTw0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Jun 2019 15:52:26 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5OJlVxP035368
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2019 15:52:25 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2tb20wyxuc-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2019 15:52:25 -0400
Received: from localhost
        by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <bauerman@linux.ibm.com>;
        Mon, 24 Jun 2019 20:52:24 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
        by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Mon, 24 Jun 2019 20:52:18 +0100
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x5OJqHtw38404584
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Jun 2019 19:52:17 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 501DFC6055;
        Mon, 24 Jun 2019 19:52:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DF23AC605B;
        Mon, 24 Jun 2019 19:52:12 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.209.86])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
        Mon, 24 Jun 2019 19:52:11 +0000 (GMT)
References: <20190611062817.18412-1-bauerman@linux.ibm.com> <20190611062817.18412-2-bauerman@linux.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.2
From:   Thiago Jung Bauermann <bauerman@linux.ibm.com>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mimi Zohar <zohar@linux.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "AKASHI\, Takahiro" <takahiro.akashi@linaro.org>,
        linux-integrity@vger.kernel.org
Subject: Re: [PATCH v11 01/13] MODSIGN: Export module signature definitions
In-reply-to: <20190611062817.18412-2-bauerman@linux.ibm.com>
Date:   Mon, 24 Jun 2019 16:52:09 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19062419-0016-0000-0000-000009C64D7D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011322; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01222738; UDB=6.00643410; IPR=6.01003899;
 MB=3.00027449; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-24 19:52:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062419-0017-0000-0000-000043C4ABE1
Message-Id: <87imsukbh2.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-24_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906240158
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hello Jessica,

AFAIK Mimi is happy with this patch set, but I still need acks from
maintainers of other subsystems that my changes touch before she can
accept it.

Is this patch OK from your PoV?

--
Thiago Jung Bauermann
IBM Linux Technology Center


Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:

> IMA will use the module_signature format for append signatures, so export
> the relevant definitions and factor out the code which verifies that the
> appended signature trailer is valid.
>
> Also, create a CONFIG_MODULE_SIG_FORMAT option so that IMA can select it
> and be able to use mod_check_sig() without having to depend on either
> CONFIG_MODULE_SIG or CONFIG_MODULES.
>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Cc: Jessica Yu <jeyu@kernel.org>
> ---
>  include/linux/module.h           |  3 --
>  include/linux/module_signature.h | 44 +++++++++++++++++++++++++
>  init/Kconfig                     |  6 +++-
>  kernel/Makefile                  |  1 +
>  kernel/module.c                  |  1 +
>  kernel/module_signature.c        | 46 ++++++++++++++++++++++++++
>  kernel/module_signing.c          | 56 +++++---------------------------
>  scripts/Makefile                 |  2 +-
>  8 files changed, 106 insertions(+), 53 deletions(-)
>
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 188998d3dca9..aa56f531cf1e 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -25,9 +25,6 @@
>  #include <linux/percpu.h>
>  #include <asm/module.h>
>
> -/* In stripped ARM and x86-64 modules, ~ is surprisingly rare. */
> -#define MODULE_SIG_STRING "~Module signature appended~\n"
> -
>  /* Not Yet Implemented */
>  #define MODULE_SUPPORTED_DEVICE(name)
>
> diff --git a/include/linux/module_signature.h b/include/linux/module_signature.h
> new file mode 100644
> index 000000000000..523617fc5b6a
> --- /dev/null
> +++ b/include/linux/module_signature.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Module signature handling.
> + *
> + * Copyright (C) 2012 Red Hat, Inc. All Rights Reserved.
> + * Written by David Howells (dhowells@redhat.com)
> + */
> +
> +#ifndef _LINUX_MODULE_SIGNATURE_H
> +#define _LINUX_MODULE_SIGNATURE_H
> +
> +/* In stripped ARM and x86-64 modules, ~ is surprisingly rare. */
> +#define MODULE_SIG_STRING "~Module signature appended~\n"
> +
> +enum pkey_id_type {
> +	PKEY_ID_PGP,		/* OpenPGP generated key ID */
> +	PKEY_ID_X509,		/* X.509 arbitrary subjectKeyIdentifier */
> +	PKEY_ID_PKCS7,		/* Signature in PKCS#7 message */
> +};
> +
> +/*
> + * Module signature information block.
> + *
> + * The constituents of the signature section are, in order:
> + *
> + *	- Signer's name
> + *	- Key identifier
> + *	- Signature data
> + *	- Information block
> + */
> +struct module_signature {
> +	u8	algo;		/* Public-key crypto algorithm [0] */
> +	u8	hash;		/* Digest algorithm [0] */
> +	u8	id_type;	/* Key identifier type [PKEY_ID_PKCS7] */
> +	u8	signer_len;	/* Length of signer's name [0] */
> +	u8	key_id_len;	/* Length of key identifier [0] */
> +	u8	__pad[3];
> +	__be32	sig_len;	/* Length of signature data */
> +};
> +
> +int mod_check_sig(const struct module_signature *ms, size_t file_len,
> +		  const char *name);
> +
> +#endif /* _LINUX_MODULE_SIGNATURE_H */
> diff --git a/init/Kconfig b/init/Kconfig
> index 8b9ffe236e4f..c2286a3c74c5 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1852,6 +1852,10 @@ config BASE_SMALL
>  	default 0 if BASE_FULL
>  	default 1 if !BASE_FULL
>
> +config MODULE_SIG_FORMAT
> +	def_bool n
> +	select SYSTEM_DATA_VERIFICATION
> +
>  menuconfig MODULES
>  	bool "Enable loadable module support"
>  	option modules
> @@ -1929,7 +1933,7 @@ config MODULE_SRCVERSION_ALL
>  config MODULE_SIG
>  	bool "Module signature verification"
>  	depends on MODULES
> -	select SYSTEM_DATA_VERIFICATION
> +	select MODULE_SIG_FORMAT
>  	help
>  	  Check modules for valid signatures upon load: the signature
>  	  is simply appended to the module. For more information see
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 33824f0385b3..f29ae2997a43 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -58,6 +58,7 @@ endif
>  obj-$(CONFIG_UID16) += uid16.o
>  obj-$(CONFIG_MODULES) += module.o
>  obj-$(CONFIG_MODULE_SIG) += module_signing.o
> +obj-$(CONFIG_MODULE_SIG_FORMAT) += module_signature.o
>  obj-$(CONFIG_KALLSYMS) += kallsyms.o
>  obj-$(CONFIG_BSD_PROCESS_ACCT) += acct.o
>  obj-$(CONFIG_CRASH_CORE) += crash_core.o
> diff --git a/kernel/module.c b/kernel/module.c
> index 6e6712b3aaf5..2712f4d217f5 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -19,6 +19,7 @@
>  #include <linux/export.h>
>  #include <linux/extable.h>
>  #include <linux/moduleloader.h>
> +#include <linux/module_signature.h>
>  #include <linux/trace_events.h>
>  #include <linux/init.h>
>  #include <linux/kallsyms.h>
> diff --git a/kernel/module_signature.c b/kernel/module_signature.c
> new file mode 100644
> index 000000000000..4224a1086b7d
> --- /dev/null
> +++ b/kernel/module_signature.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Module signature checker
> + *
> + * Copyright (C) 2012 Red Hat, Inc. All Rights Reserved.
> + * Written by David Howells (dhowells@redhat.com)
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/printk.h>
> +#include <linux/module_signature.h>
> +#include <asm/byteorder.h>
> +
> +/**
> + * mod_check_sig - check that the given signature is sane
> + *
> + * @ms:		Signature to check.
> + * @file_len:	Size of the file to which @ms is appended.
> + * @name:	What is being checked. Used for error messages.
> + */
> +int mod_check_sig(const struct module_signature *ms, size_t file_len,
> +		  const char *name)
> +{
> +	if (be32_to_cpu(ms->sig_len) >= file_len - sizeof(*ms))
> +		return -EBADMSG;
> +
> +	if (ms->id_type != PKEY_ID_PKCS7) {
> +		pr_err("%s: Module is not signed with expected PKCS#7 message\n",
> +		       name);
> +		return -ENOPKG;
> +	}
> +
> +	if (ms->algo != 0 ||
> +	    ms->hash != 0 ||
> +	    ms->signer_len != 0 ||
> +	    ms->key_id_len != 0 ||
> +	    ms->__pad[0] != 0 ||
> +	    ms->__pad[1] != 0 ||
> +	    ms->__pad[2] != 0) {
> +		pr_err("%s: PKCS#7 signature info has unexpected non-zero params\n",
> +		       name);
> +		return -EBADMSG;
> +	}
> +
> +	return 0;
> +}
> diff --git a/kernel/module_signing.c b/kernel/module_signing.c
> index 6b9a926fd86b..cdd04a6b8074 100644
> --- a/kernel/module_signing.c
> +++ b/kernel/module_signing.c
> @@ -11,37 +11,13 @@
>
>  #include <linux/kernel.h>
>  #include <linux/errno.h>
> +#include <linux/module.h>
> +#include <linux/module_signature.h>
>  #include <linux/string.h>
>  #include <linux/verification.h>
>  #include <crypto/public_key.h>
>  #include "module-internal.h"
>
> -enum pkey_id_type {
> -	PKEY_ID_PGP,		/* OpenPGP generated key ID */
> -	PKEY_ID_X509,		/* X.509 arbitrary subjectKeyIdentifier */
> -	PKEY_ID_PKCS7,		/* Signature in PKCS#7 message */
> -};
> -
> -/*
> - * Module signature information block.
> - *
> - * The constituents of the signature section are, in order:
> - *
> - *	- Signer's name
> - *	- Key identifier
> - *	- Signature data
> - *	- Information block
> - */
> -struct module_signature {
> -	u8	algo;		/* Public-key crypto algorithm [0] */
> -	u8	hash;		/* Digest algorithm [0] */
> -	u8	id_type;	/* Key identifier type [PKEY_ID_PKCS7] */
> -	u8	signer_len;	/* Length of signer's name [0] */
> -	u8	key_id_len;	/* Length of key identifier [0] */
> -	u8	__pad[3];
> -	__be32	sig_len;	/* Length of signature data */
> -};
> -
>  /*
>   * Verify the signature on a module.
>   */
> @@ -49,6 +25,7 @@ int mod_verify_sig(const void *mod, struct load_info *info)
>  {
>  	struct module_signature ms;
>  	size_t sig_len, modlen = info->len;
> +	int ret;
>
>  	pr_devel("==>%s(,%zu)\n", __func__, modlen);
>
> @@ -56,32 +33,15 @@ int mod_verify_sig(const void *mod, struct load_info *info)
>  		return -EBADMSG;
>
>  	memcpy(&ms, mod + (modlen - sizeof(ms)), sizeof(ms));
> -	modlen -= sizeof(ms);
> +
> +	ret = mod_check_sig(&ms, modlen, info->name);
> +	if (ret)
> +		return ret;
>
>  	sig_len = be32_to_cpu(ms.sig_len);
> -	if (sig_len >= modlen)
> -		return -EBADMSG;
> -	modlen -= sig_len;
> +	modlen -= sig_len + sizeof(ms);
>  	info->len = modlen;
>
> -	if (ms.id_type != PKEY_ID_PKCS7) {
> -		pr_err("%s: Module is not signed with expected PKCS#7 message\n",
> -		       info->name);
> -		return -ENOPKG;
> -	}
> -
> -	if (ms.algo != 0 ||
> -	    ms.hash != 0 ||
> -	    ms.signer_len != 0 ||
> -	    ms.key_id_len != 0 ||
> -	    ms.__pad[0] != 0 ||
> -	    ms.__pad[1] != 0 ||
> -	    ms.__pad[2] != 0) {
> -		pr_err("%s: PKCS#7 signature info has unexpected non-zero params\n",
> -		       info->name);
> -		return -EBADMSG;
> -	}
> -
>  	return verify_pkcs7_signature(mod, modlen, mod + modlen, sig_len,
>  				      VERIFY_USE_SECONDARY_KEYRING,
>  				      VERIFYING_MODULE_SIGNATURE,
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 9d442ee050bd..52098b080ab7 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -17,7 +17,7 @@ hostprogs-$(CONFIG_VT)           += conmakehash
>  hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
>  hostprogs-$(CONFIG_BUILDTIME_EXTABLE_SORT) += sortextable
>  hostprogs-$(CONFIG_ASN1)	 += asn1_compiler
> -hostprogs-$(CONFIG_MODULE_SIG)	 += sign-file
> +hostprogs-$(CONFIG_MODULE_SIG_FORMAT) += sign-file
>  hostprogs-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += extract-cert
>  hostprogs-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE) += insert-sys-cert
>

