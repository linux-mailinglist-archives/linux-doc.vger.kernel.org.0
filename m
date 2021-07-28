Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2AEB3D8CDF
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jul 2021 13:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234395AbhG1Lim (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Jul 2021 07:38:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:39070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232530AbhG1Lim (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Jul 2021 07:38:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6960160F0F;
        Wed, 28 Jul 2021 11:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627472320;
        bh=Ed2M1byFas5CO43HSA9Lq5GBOUwZSeoYtuJfi8LoAV4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KDURb2ySdRAfjvo5j+UgIFVDMo8Jf/RpF6G2uDWbhGYHKOiaPzSfoiEh0yaplfv0g
         kEAG1j/cpuKFNqw77gKIo9+BVgANKIN5GTqO3CMqxeCraVRgK7/1dgN3QWZPxlTtmx
         3o2qz7sOYjDQLfZdA5F4fbGw3/jh3X05P/59fLuxh/YDRW8FDWyQqW9vny+B6V8n4i
         kzeLN83EfE39JDVQGiPotb7KnIHjTAt2SG9S/eBmWmfdleRDuPQnHI4G14CEBs/SYC
         xi7nJ/usEEG1N4rzkWnq0L4oUoTBMUz1Fkp7xjA8VUpzVaRPmKlme36grvz2SqELAT
         l10Ls+6ecP5ZQ==
Date:   Wed, 28 Jul 2021 13:38:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Roberto Sassu <roberto.sassu@huawei.com>
Cc:     <zohar@linux.ibm.com>, <gregkh@linuxfoundation.org>,
        <linux-integrity@vger.kernel.org>,
        <linux-security-module@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [RFC][PATCH v2 03/12] diglim: Objects
Message-ID: <20210728133835.2e55e0eb@coco.lan>
In-Reply-To: <20210726163700.2092768-4-roberto.sassu@huawei.com>
References: <20210726163700.2092768-1-roberto.sassu@huawei.com>
        <20210726163700.2092768-4-roberto.sassu@huawei.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Mon, 26 Jul 2021 18:36:51 +0200
Roberto Sassu <roberto.sassu@huawei.com> escreveu:

> Define the objects to manage digest lists:
> 
> - digest_list_item: a digest list loaded into the kernel;
> - digest_list_item_ref: a reference to a digest list;
> - digest_item: a digest of a digest list.
> 
> Also define some helpers for the objects. More information can be found in
> Documentation/security/diglim/implementation.rst.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  .../security/diglim/implementation.rst        | 105 ++++++++++++++
>  MAINTAINERS                                   |   1 +
>  security/integrity/diglim/diglim.h            | 134 ++++++++++++++++++
>  3 files changed, 240 insertions(+)
>  create mode 100644 security/integrity/diglim/diglim.h
> 
> diff --git a/Documentation/security/diglim/implementation.rst b/Documentation/security/diglim/implementation.rst
> index 59a180b3bb3f..6002049612a1 100644
> --- a/Documentation/security/diglim/implementation.rst
> +++ b/Documentation/security/diglim/implementation.rst
> @@ -95,3 +95,108 @@ with digest lists:
>  
>  - ``DIGEST_LIST_ADD``: the digest list is being added;
>  - ``DIGEST_LIST_DEL``: the digest list is being deleted.
> +
> +
> +Objects
> +-------
> +
> +This section defines the objects to manage digest lists.
> +
> +.. kernel-doc:: security/integrity/diglim/diglim.h
> +
> +They are represented in the following class diagram:
> +
> +::
> +
> + digest_offset,
> + hdr_offset---------------+
> +                          |
> +                          |
> + +------------------+     |     +----------------------+
> + | digest_list_item |--- N:1 ---| digest_list_item_ref |
> + +------------------+           +----------------------+
> +                                           |
> +                                          1:N
> +                                           |
> +                                    +-------------+
> +                                    | digest_item |
> +                                    +-------------+
> +
> +A ``digest_list_item`` is associated to one or multiple
> +``digest_list_item_ref``, one for each digest it contains. However,
> +a ``digest_list_item_ref`` is associated to only one ``digest_list_item``,
> +as it represents a single location within a specific digest list.
> +
> +Given that a ``digest_list_item_ref`` represents a single location, it is
> +associated to only one ``digest_item``. However, a ``digest_item`` can have
> +multiple references (as it might appears multiple times within the same
> +digest list or in different digest lists, if it is duplicated).
> +
> +All digest list references are stored for a given digest, so that a query
> +result can include the OR of the modifiers and actions of each referenced
> +digest list.
> +
> +The relationship between the described objects can be graphically
> +represented as:
> +
> +::

Just merge "::" at the previous line (everywhere).

> +
> + Hash table            +-------------+         +-------------+
> + PARSER      +-----+   | digest_item |         | digest_item |
> + FILE        | key |-->|             |-->...-->|             |
> + METADATA    +-----+   |ref0|...|refN|         |ref0|...|refN|
> +                       +-------------+         +-------------+
> +            ref0:         |                               | refN:
> +            digest_offset | +-----------------------------+ digest_offset
> +            hdr_offset    | |                               hdr_offset
> +                          | |
> +                          V V
> +                     +--------------------+
> +                     |  digest_list_item  |
> +                     |                    |
> +                     | size, buf, actions |
> +                     +--------------------+
> +                          ^
> +                          |
> + Hash table            +-------------+         +-------------+
> + DIGEST_LIST +-----+   |ref0         |         |ref0         |
> +             | key |-->|             |-->...-->|             |
> +             +-----+   | digest_item |         | digest_item |
> +                       +-------------+         +-------------+
> +
> +The reference for the digest of the digest list differs from the references
> +for the other digest types. ``digest_offset`` and ``hdr_offset`` are set to
> +zero, so that the digest of the digest list is retrieved from the
> +``digest_list_item`` structure directly (see ``get_digest()`` below).
> +
> +Finally, this section defines useful helpers to access a digest or the
> +header the digest belongs to. For example:
> +
> +::
> +
> + static inline struct compact_list_hdr *get_hdr(
> +                                      struct digest_list_item *digest_list,
> +                                      loff_t hdr_offset)

I would write this to avoid ending a line with an open parenthesis. You could,
for instance, write it as:

	static inline struct compact_list_hdr *
	get_hdr(struct digest_list_item *digest_list,
		off_t hdr_offset)

if you also want to avoid to have a line bigger than 80 columns.

> + {
> +         return (struct compact_list_hdr *)(digest_list->buf + hdr_offset);
> + }
> +
> +the header can be obtained by summing the address of the digest list buffer
> +in the ``digest_list_item`` structure with ``hdr_offset``.
> +
> +Similarly:
> +
> +::
> +
> + static inline u8 *get_digest(struct digest_list_item *digest_list,
> +                              loff_t digest_offset, loff_t hdr_offset)
> + {
> +         /* Digest list digest is stored in a different place. */
> +         if (!digest_offset)
> +                 return digest_list->digest;
> +         return digest_list->buf + digest_offset;
> + }
> +
> +the digest can be obtained by summing the address of the digest list buffer
> +with ``digest_offset`` (except for the digest lists, where the digest is
> +stored in the ``digest`` field of the ``digest_list_item`` structure).
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f61f5239468a..f7592d41367d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5462,6 +5462,7 @@ F:	Documentation/security/diglim/implementation.rst
>  F:	Documentation/security/diglim/index.rst
>  F:	Documentation/security/diglim/introduction.rst
>  F:	include/uapi/linux/diglim.h
> +F:	security/integrity/diglim/diglim.h
>  
>  DIOLAN U2C-12 I2C DRIVER
>  M:	Guenter Roeck <linux@roeck-us.net>
> diff --git a/security/integrity/diglim/diglim.h b/security/integrity/diglim/diglim.h
> new file mode 100644
> index 000000000000..578253d7e1d1
> --- /dev/null
> +++ b/security/integrity/diglim/diglim.h
> @@ -0,0 +1,134 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2005,2006,2007,2008 IBM Corporation
> + * Copyright (C) 2017-2021 Huawei Technologies Duesseldorf GmbH
> + *
> + * Author: Roberto Sassu <roberto.sassu@huawei.com>
> + *
> + * Definitions only used inside DIGLIM.
> + */
> +
> +#ifndef __DIGLIM_INTERNAL_H
> +#define __DIGLIM_INTERNAL_H
> +
> +#include <linux/types.h>
> +#include <linux/crypto.h>
> +#include <linux/fs.h>
> +#include <linux/security.h>
> +#include <linux/hash.h>
> +#include <linux/tpm.h>
> +#include <linux/audit.h>
> +#include <crypto/hash_info.h>
> +#include <linux/hash_info.h>
> +#include <uapi/linux/diglim.h>
> +
> +#define MAX_DIGEST_SIZE 64
> +#define HASH_BITS 10
> +#define DIGLIM_HTABLE_SIZE (1 << HASH_BITS)
> +
> +/**
> + * struct digest_list_item - a digest list loaded into the kernel
> + *
> + * @size: size of the digest list buffer
> + * @buf: digest list buffer
> + * @digest: digest of the digest list
> + * @label: label used to identify the digest list (e.g. file name)
> + * @actions: actions performed on the digest list
> + * @algo: digest algorithm
> + */
> +struct digest_list_item {
> +	loff_t size;
> +	u8 *buf;
> +	u8 digest[64];
> +	const char *label;
> +	u8 actions;
> +	enum hash_algo algo;
> +};
> +
> +/**
> + * struct digest_list_item_ref - a reference to a digest list
> + *
> + * @list: linked list pointers
> + * @digest_list: pointer to struct digest_list_item
> + * @digest_offset: offset of the digest in the referenced digest list
> + * @hdr_offset: offset of the header the digest refers to in the digest list
> + */
> +struct digest_list_item_ref {
> +	struct list_head list;
> +	struct digest_list_item *digest_list;
> +	u32 digest_offset;
> +	u32 hdr_offset;
> +};
> +
> +/**
> + * struct digest_item - a digest of a digest list
> + *
> + * @hnext: pointers of the hash table
> + * @refs: linked list of struct digest_list_item_ref
> + */
> +struct digest_item {
> +	struct hlist_node hnext;
> +	struct list_head refs;
> +};
> +


> +struct h_table {
> +	unsigned long len;
> +	struct hlist_head queue[DIGLIM_HTABLE_SIZE];
> +};
> +
> +static inline unsigned int hash_key(u8 *digest)
> +{
> +	return (digest[0] | digest[1] << 8) % DIGLIM_HTABLE_SIZE;
> +}
> +
> +static inline struct compact_list_hdr *get_hdr(
> +					struct digest_list_item *digest_list,
> +					loff_t hdr_offset)

Same here with regards to open parenthesis.

> +{
> +	return (struct compact_list_hdr *)(digest_list->buf + hdr_offset);
> +}
> +
> +static inline enum hash_algo get_algo(struct digest_list_item *digest_list,
> +				      loff_t digest_offset, loff_t hdr_offset)
> +{
> +	/* Digest list digest algorithm is stored in a different place. */
> +	if (!digest_offset)
> +		return digest_list->algo;
> +
> +	return get_hdr(digest_list, hdr_offset)->algo;
> +}
> +
> +static inline u8 *get_digest(struct digest_list_item *digest_list,
> +			     loff_t digest_offset, loff_t hdr_offset)
> +{
> +	/* Digest list digest is stored in a different place. */
> +	if (!digest_offset)
> +		return digest_list->digest;
> +
> +	return digest_list->buf + digest_offset;
> +}
> +
> +static inline struct compact_list_hdr *get_hdr_ref(
> +					struct digest_list_item_ref *ref)
> +{
> +	return get_hdr(ref->digest_list, ref->hdr_offset);
> +}
> +
> +static inline enum hash_algo get_algo_ref(struct digest_list_item_ref *ref)
> +{
> +	/* Digest list digest algorithm is stored in a different place. */
> +	if (!ref->digest_offset)
> +		return ref->digest_list->algo;
> +
> +	return get_hdr_ref(ref)->algo;
> +}
> +
> +static inline u8 *get_digest_ref(struct digest_list_item_ref *ref)
> +{
> +	/* Digest list digest is stored in a different place. */
> +	if (!ref->digest_offset)
> +		return ref->digest_list->digest;
> +
> +	return ref->digest_list->buf + ref->digest_offset;
> +}

I would also document the above static inline functions and 
struct h_table.

> +#endif /*__DIGLIM_INTERNAL_H*/



Thanks,
Mauro
