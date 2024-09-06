Return-Path: <linux-doc+bounces-24673-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A702796ED8D
	for <lists+linux-doc@lfdr.de>; Fri,  6 Sep 2024 10:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04DF1B26DD4
	for <lists+linux-doc@lfdr.de>; Fri,  6 Sep 2024 08:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74806157A41;
	Fri,  6 Sep 2024 08:17:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6D5156967;
	Fri,  6 Sep 2024 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610641; cv=none; b=BEh1g01QZ89PZi01nCY9PzITPCU7zUzEtaCro0rAFQTwGWKQ7cDTAMxXzCuDCLYTvqpmIr0CIWTF4+0LDRGxSJOvvNdlLDY9BycISVuin5ZNcYJbD4fGTLScYZjSs0x2Qc5x8iTDw9Vp8phaXMKn6Y/U3AqUSQ9Vi6aOFp0cxTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610641; c=relaxed/simple;
	bh=iBJc4tM6bwGJyAbJv/jUhEx5GvfQcp6rtTqfCVrdDsk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aQJ4/gZwds9Nbn4Xos+oSYnZmnKgL1JxQIciP7Ro25J8QENYAnODc4T3G/ON6/d1X8iokgpX/qya+943n5vFEH606x3dBcKXd7en0j45uiU7Ooa8FBxRK2j1VRlCJpv/eCQ1Socz/bFamY1FZl+p4zQuIr+TkcQxREgvJDL3pLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4X0T301vRJz9v7JY;
	Fri,  6 Sep 2024 15:52:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id D47AA140B3E;
	Fri,  6 Sep 2024 16:17:04 +0800 (CST)
Received: from [127.0.0.1] (unknown [10.204.63.22])
	by APP2 (Coremail) with SMTP id GxC2BwBnFsduutpmh_dgAA--.21582S2;
	Fri, 06 Sep 2024 09:17:03 +0100 (CET)
Message-ID: <5b97f560434a732f6fc85863fa4429ce3a3f3396.camel@huaweicloud.com>
Subject: Re: [PATCH v5 01/14] lib: Add TLV parser
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, zohar@linux.ibm.com, 
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, corbet@lwn.net, 
	akpm@linux-foundation.org, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, shuah@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com
Cc: linux-integrity@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, wufan@linux.microsoft.com,
 pbrobinson@gmail.com,  zbyszek@in.waw.pl, hch@lst.de, mjg59@srcf.ucam.org,
 pmatilai@redhat.com,  jannh@google.com, dhowells@redhat.com,
 jikos@kernel.org, mkoutny@suse.com,  ppavlu@suse.com, petr.vorel@gmail.com,
 mzerqung@0pointer.de, kgold@linux.ibm.com,  Roberto Sassu
 <roberto.sassu@huawei.com>
Date: Fri, 06 Sep 2024 10:16:43 +0200
In-Reply-To: <87le05nr4b.fsf@intel.com>
References: <20240905150543.3766895-1-roberto.sassu@huaweicloud.com>
	 <20240905150543.3766895-2-roberto.sassu@huaweicloud.com>
	 <87ikvaovnf.fsf@intel.com>
	 <f0b4867451dd5fe2ba59e2dad4274314aa0660f9.camel@huaweicloud.com>
	 <87le05nr4b.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:GxC2BwBnFsduutpmh_dgAA--.21582S2
X-Coremail-Antispam: 1UD129KBjvAXoW3tF4kJw18GFWfury7JFWDJwb_yoW8Zr4rCo
	W3Zr47Ar4rJr1UC3WUA3yDZryjy3yrWr43A347CrW3Ca40va1jkr45tr45Gay5Cw45Kr45
	JasrX343ZFWYqr1rn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUY27kC6x804xWl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK
	8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8
	Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	jxCztUUUUU=
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAQASBGbaZPMEAAAAs4

On Fri, 2024-09-06 at 11:06 +0300, Jani Nikula wrote:
> On Fri, 06 Sep 2024, Roberto Sassu <roberto.sassu@huaweicloud.com> wrote:
> > On Thu, 2024-09-05 at 20:30 +0300, Jani Nikula wrote:
> > > On Thu, 05 Sep 2024, Roberto Sassu <roberto.sassu@huaweicloud.com> wr=
ote:
> > > > From: Roberto Sassu <roberto.sassu@huawei.com>
> > > >=20
> > > > Add a parser of a generic Type-Length-Value (TLV) format:
> > > >=20
> > > > +-----------------+------------------+-----------------+
> > > > > data type (u64) | num fields (u64) | total len (u64) | # header
> > > > +--------------+--+---------+--------+---------+-------+
> > > > > field1 (u64) | len1 (u64) | value1 (u8 len1) |
> > > > +--------------+------------+------------------+
> > > > >     ...      |    ...     |        ...       |         # data
> > > > +--------------+------------+------------------+
> > > > > fieldN (u64) | lenN (u64) | valueN (u8 lenN) |
> > > > +--------------+------------+------------------+
> > >=20
> > > Okay, take this with a grain of salt. I'm actually not interested in
> > > your use case, but the generic part here. But hear me out.
> > >=20
> > > Why do you need to have num fields in the header? I'd think the gener=
ic
> > > TLV would have tag/length/value, where value may contain more TLV, or
> > > not, depending on the use case specific tag. The same parser can pars=
e
> > > everything recursively, with no special handling for headers. To me,
> > > that's the great part about TLV.
> >=20
> > Hi Jani
> >=20
> > the purpose of the number of entries is that the kernel uses it to
> > correctly size the hash table, before adding digests to it.
> >=20
> > It also allows to group digests together and define attributes for all
> > of them (e.g. the hash algorithm).
> >=20
> > You can also have multiple data blocks in the same file, and the header
> > allows to go to the ones of interest.
>=20
> Or you could have a TLV entry to define how many fields follow. With no
> dedicated header entries. You can choose what tags mean.

Ok, I guess it is possible to do this way too.

> Oh, another angle is that you could have e.g. the lowest bit in the tag
> indicate whether the value is TLV too. So you can validate the TLV all
> the way down to the non-TLV values.

Not sure I follow, the parser associated to a TLV type knows if it is a
nested TLV. Look at parse_digest_list_entry() in patch 7/14. The field
parser is calling tlv_parse() inside.

The parsers are user-defined and invoked through callbacks, the TLV
parser itself remains the same regardless of how data are structured.

> > > Also, making generic TLV have u64 tag and length is huge waste in mos=
t
> > > use cases. Saving one byte requires 16 bytes of tag and length. You
> > > could encode tag and length with UTF-8. Sure, it's wasteful if you ne=
ed
> > > an enormous amount of tags or huge lengths, but it's efficient for mo=
st
> > > use cases.
> >=20
> > You are right, it is a huge size. You can introduce new fields, but not
> > modify the tag and length size for retrocompatibility.
> >=20
> > Ok, I see your point for UTF-8. Let's see, I like how simple is the
> > parser now.
>=20
> If you like simplicity, you should not have a different header entry. ;)

Good point.

> See utf8encode() and utf8decode() in fs/unicode/mkutf8data.c for an
> implementation. Of course, this severely limits the max length from u64,
> to put it mildly, max being 0x10ffff. Maybe that's a limitation you
> don't want. But fixing at u64 seems bad too.

I can reduce to u32, I doubt that more will be necessary.

Thanks

Roberto


> BR,
> Jani.
>=20
> >=20
> > Thanks
> >=20
> > Roberto
> >=20
> > > Anyway, just my thoughts.
> > >=20
> > >=20
> > > BR,
> > > Jani.
> > >=20
> > > >=20
> > > > [same as above, repeated N times]
> > > >=20
> > > > Each adopter can define its own data types and fields. The TLV pars=
er does
> > > > not need to be aware of those, but lets the adopter obtain the data=
 and
> > > > decide how to continue.
> > > >=20
> > > > After parsing each TLV header, call the header callback function wi=
th the
> > > > callback data provided by the adopter. The latter can return 0, to =
skip
> > > > processing of the TLV data, 1 to process the TLV data, or a negativ=
e value
> > > > to stop processing the TLV data.
> > > >=20
> > > > After processing a TLV data entry, call the data callback function =
also
> > > > with the callback data provided by the adopter. The latter can deci=
de how
> > > > to interpret the TLV data entry depending on the field ID.
> > > >=20
> > > > Nesting TLVs is also possible, the data callback function can call
> > > > tlv_parse() to parse the inner structure.
> > > >=20
> > > > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > > > ---
> > > >  MAINTAINERS                     |   8 ++
> > > >  include/linux/tlv_parser.h      |  48 +++++++
> > > >  include/uapi/linux/tlv_parser.h |  62 +++++++++
> > > >  lib/Kconfig                     |   3 +
> > > >  lib/Makefile                    |   2 +
> > > >  lib/tlv_parser.c                | 221 ++++++++++++++++++++++++++++=
++++
> > > >  lib/tlv_parser.h                |  17 +++
> > > >  7 files changed, 361 insertions(+)
> > > >  create mode 100644 include/linux/tlv_parser.h
> > > >  create mode 100644 include/uapi/linux/tlv_parser.h
> > > >  create mode 100644 lib/tlv_parser.c
> > > >  create mode 100644 lib/tlv_parser.h
> > > >=20
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 8766f3e5e87e..ba8d5c137bef 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -23055,6 +23055,14 @@ W:	http://sourceforge.net/projects/tlan/
> > > >  F:	Documentation/networking/device_drivers/ethernet/ti/tlan.rst
> > > >  F:	drivers/net/ethernet/ti/tlan.*
> > > > =20
> > > > +TLV PARSER
> > > > +M:	Roberto Sassu <roberto.sassu@huawei.com>
> > > > +L:	linux-kernel@vger.kernel.org
> > > > +S:	Maintained
> > > > +F:	include/linux/tlv_parser.h
> > > > +F:	include/uapi/linux/tlv_parser.h
> > > > +F:	lib/tlv_parser.*
> > > > +
> > > >  TMIO/SDHI MMC DRIVER
> > > >  M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > >  L:	linux-mmc@vger.kernel.org
> > > > diff --git a/include/linux/tlv_parser.h b/include/linux/tlv_parser.=
h
> > > > new file mode 100644
> > > > index 000000000000..6d9a655d9ec9
> > > > --- /dev/null
> > > > +++ b/include/linux/tlv_parser.h
> > > > @@ -0,0 +1,48 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +/*
> > > > + * Copyright (C) 2023-2024 Huawei Technologies Duesseldorf GmbH
> > > > + *
> > > > + * Author: Roberto Sassu <roberto.sassu@huawei.com>
> > > > + *
> > > > + * Header file of TLV parser.
> > > > + */
> > > > +
> > > > +#ifndef _LINUX_TLV_PARSER_H
> > > > +#define _LINUX_TLV_PARSER_H
> > > > +
> > > > +#include <uapi/linux/tlv_parser.h>
> > > > +
> > > > +/**
> > > > + * typedef hdr_callback - Callback after parsing TLV header
> > > > + * @callback_data: Opaque data to supply to the header callback fu=
nction
> > > > + * @data_type: TLV data type
> > > > + * @num_entries: Number of TLV data entries
> > > > + * @total_len: Total length of TLV data
> > > > + *
> > > > + * This callback is invoked after a TLV header is parsed.
> > > > + *
> > > > + * Return: 0 to skip processing, 1 to do processing, a negative va=
lue on error.
> > > > + */
> > > > +typedef int (*hdr_callback)(void *callback_data, __u64 data_type,
> > > > +			    __u64 num_entries, __u64 total_len);
> > > > +
> > > > +/**
> > > > + * typedef data_callback - Callback after parsing TLV data entry
> > > > + * @callback_data: Opaque data to supply to the data callback func=
tion
> > > > + * @field: TLV field ID
> > > > + * @field_data: Data of a TLV data field
> > > > + * @field_len: Length of @field_data
> > > > + *
> > > > + * This callback is invoked after a TLV data entry is parsed.
> > > > + *
> > > > + * Return: 0 on success, a negative value on error.
> > > > + */
> > > > +typedef int (*data_callback)(void *callback_data, __u64 field,
> > > > +			     const __u8 *field_data, __u64 field_len);
> > > > +
> > > > +int tlv_parse(hdr_callback hdr_callback, void *hdr_callback_data,
> > > > +	      data_callback data_callback, void *data_callback_data,
> > > > +	      const __u8 *data, size_t data_len, const char **data_types,
> > > > +	      __u64 num_data_types, const char **fields, __u64 num_fields=
);
> > > > +
> > > > +#endif /* _LINUX_TLV_PARSER_H */
> > > > diff --git a/include/uapi/linux/tlv_parser.h b/include/uapi/linux/t=
lv_parser.h
> > > > new file mode 100644
> > > > index 000000000000..fbd4fc403ac7
> > > > --- /dev/null
> > > > +++ b/include/uapi/linux/tlv_parser.h
> > > > @@ -0,0 +1,62 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > > > +/*
> > > > + * Copyright (C) 2023-2024 Huawei Technologies Duesseldorf GmbH
> > > > + *
> > > > + * Author: Roberto Sassu <roberto.sassu@huawei.com>
> > > > + *
> > > > + * Implement the user space interface for the TLV parser.
> > > > + */
> > > > +
> > > > +#ifndef _UAPI_LINUX_TLV_PARSER_H
> > > > +#define _UAPI_LINUX_TLV_PARSER_H
> > > > +
> > > > +#include <linux/types.h>
> > > > +
> > > > +/*
> > > > + * TLV format:
> > > > + *
> > > > + * +-----------------+------------------+-----------------+
> > > > + * | data type (u64) | num fields (u64) | total len (u64) | # head=
er
> > > > + * +--------------+--+---------+--------+---------+-------+
> > > > + * | field1 (u64) | len1 (u64) | value1 (u8 len1) |
> > > > + * +--------------+------------+------------------+
> > > > + * |     ...      |    ...     |        ...       |         # data
> > > > + * +--------------+------------+------------------+
> > > > + * | fieldN (u64) | lenN (u64) | valueN (u8 lenN) |
> > > > + * +--------------+------------+------------------+
> > > > + *
> > > > + * [same as above, repeated N times]
> > > > + *
> > > > + */
> > > > +
> > > > +/**
> > > > + * struct tlv_hdr - Header of TLV format
> > > > + * @data_type: Type of data to parse
> > > > + * @num_entries: Number of data entries provided
> > > > + * @_reserved: Reserved for future use (must be equal to zero)
> > > > + * @total_len: Total length of the data blob, excluding the header
> > > > + *
> > > > + * This structure represents the header of the TLV data format.
> > > > + */
> > > > +struct tlv_hdr {
> > > > +	__u64 data_type;
> > > > +	__u64 num_entries;
> > > > +	__u64 _reserved;
> > > > +	__u64 total_len;
> > > > +} __attribute__((packed));
> > > > +
> > > > +/**
> > > > + * struct tlv_data_entry - Data entry of TLV format
> > > > + * @field: Data field identifier
> > > > + * @length: Data length
> > > > + * @data: Data
> > > > + *
> > > > + * This structure represents a TLV data entry.
> > > > + */
> > > > +struct tlv_data_entry {
> > > > +	__u64 field;
> > > > +	__u64 length;
> > > > +	__u8 data[];
> > > > +} __attribute__((packed));
> > > > +
> > > > +#endif /* _UAPI_LINUX_TLV_PARSER_H */
> > > > diff --git a/lib/Kconfig b/lib/Kconfig
> > > > index b38849af6f13..9141dcfc1704 100644
> > > > --- a/lib/Kconfig
> > > > +++ b/lib/Kconfig
> > > > @@ -777,3 +777,6 @@ config POLYNOMIAL
> > > > =20
> > > >  config FIRMWARE_TABLE
> > > >  	bool
> > > > +
> > > > +config TLV_PARSER
> > > > +	bool
> > > > diff --git a/lib/Makefile b/lib/Makefile
> > > > index 322bb127b4dc..c6c3614c4293 100644
> > > > --- a/lib/Makefile
> > > > +++ b/lib/Makefile
> > > > @@ -392,6 +392,8 @@ obj-$(CONFIG_USERCOPY_KUNIT_TEST) +=3D usercopy=
_kunit.o
> > > >  obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) +=3D devmem_is_allowed=
.o
> > > > =20
> > > >  obj-$(CONFIG_FIRMWARE_TABLE) +=3D fw_table.o
> > > > +obj-$(CONFIG_TLV_PARSER) +=3D tlv_parser.o
> > > > +CFLAGS_tlv_parser.o +=3D -I lib
> > > > =20
> > > >  # FORTIFY_SOURCE compile-time behavior tests
> > > >  TEST_FORTIFY_SRCS =3D $(wildcard $(src)/test_fortify/*-*.c)
> > > > diff --git a/lib/tlv_parser.c b/lib/tlv_parser.c
> > > > new file mode 100644
> > > > index 000000000000..5d54844ab8d7
> > > > --- /dev/null
> > > > +++ b/lib/tlv_parser.c
> > > > @@ -0,0 +1,221 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright (C) 2023-2024 Huawei Technologies Duesseldorf GmbH
> > > > + *
> > > > + * Author: Roberto Sassu <roberto.sassu@huawei.com>
> > > > + *
> > > > + * Implement the TLV parser.
> > > > + */
> > > > +
> > > > +#define pr_fmt(fmt) "tlv_parser: "fmt
> > > > +#include <tlv_parser.h>
> > > > +
> > > > +/**
> > > > + * tlv_parse_hdr - Parse TLV header
> > > > + * @hdr_callback: Callback function to call after parsing header
> > > > + * @hdr_callback_data: Opaque data to supply to the header callbac=
k function
> > > > + * @data: Data to parse (updated)
> > > > + * @data_len: Length of @data (updated)
> > > > + * @parsed_num_entries: Parsed number of data entries (updated)
> > > > + * @parsed_total_len: Parsed length of TLV data, excluding the hea=
der (updated)
> > > > + * @data_types: Array of data type strings
> > > > + * @num_data_types: Number of elements of @data_types
> > > > + *
> > > > + * Parse the header of the TLV data format, move the data pointer =
to the TLV
> > > > + * data part, decrease the data length by the length of the header=
, and provide
> > > > + * the number of entries and the total data length extracted from =
the header.
> > > > + *
> > > > + * Before returning, call the header callback to let the callback =
supplier
> > > > + * decide whether or not to process the subsequent TLV data.
> > > > + *
> > > > + * Return: 1 to process the data entries, 0 to skip, a negative va=
lue on error.
> > > > + */
> > > > +static int tlv_parse_hdr(hdr_callback hdr_callback, void *hdr_call=
back_data,
> > > > +			 const __u8 **data, size_t *data_len,
> > > > +			 __u64 *parsed_num_entries, __u64 *parsed_total_len,
> > > > +			 const char **data_types, __u64 num_data_types)
> > > > +{
> > > > +	__u64 parsed_data_type;
> > > > +	struct tlv_hdr *hdr;
> > > > +
> > > > +	if (*data_len < sizeof(*hdr)) {
> > > > +		pr_debug("Data blob too short, %lu bytes, expected %lu\n",
> > > > +			 *data_len, sizeof(*hdr));
> > > > +		return -EBADMSG;
> > > > +	}
> > > > +
> > > > +	hdr =3D (struct tlv_hdr *)*data;
> > > > +
> > > > +	*data +=3D sizeof(*hdr);
> > > > +	*data_len -=3D sizeof(*hdr);
> > > > +
> > > > +	parsed_data_type =3D __be64_to_cpu(hdr->data_type);
> > > > +	if (parsed_data_type >=3D num_data_types) {
> > > > +		pr_debug("Invalid data type %llu, max: %llu\n",
> > > > +			 parsed_data_type, num_data_types - 1);
> > > > +		return -EBADMSG;
> > > > +	}
> > > > +
> > > > +	*parsed_num_entries =3D __be64_to_cpu(hdr->num_entries);
> > > > +
> > > > +	if (hdr->_reserved !=3D 0) {
> > > > +		pr_debug("_reserved must be zero\n");
> > > > +		return -EBADMSG;
> > > > +	}
> > > > +
> > > > +	*parsed_total_len =3D __be64_to_cpu(hdr->total_len);
> > > > +	if (*parsed_total_len > *data_len) {
> > > > +		pr_debug("Invalid total length %llu, expected: %lu\n",
> > > > +			 *parsed_total_len, *data_len);
> > > > +		return -EBADMSG;
> > > > +	}
> > > > +
> > > > +	pr_debug("Header: type: %s, num entries: %llu, total len: %lld\n"=
,
> > > > +		 data_types[parsed_data_type], *parsed_num_entries,
> > > > +		 *parsed_total_len);
> > > > +
> > > > +	return hdr_callback(hdr_callback_data, parsed_data_type,
> > > > +			    *parsed_num_entries, *parsed_total_len);
> > > > +}
> > > > +
> > > > +/**
> > > > + * tlv_parse_data - Parse TLV data
> > > > + * @data_callback: Callback function to call to parse the data ent=
ries
> > > > + * @data_callback_data: Opaque data to supply to the data callback=
 function
> > > > + * @num_entries: Number of data entries to parse
> > > > + * @data: Data to parse
> > > > + * @data_len: Length of @data
> > > > + * @fields: Array of field strings
> > > > + * @num_fields: Number of elements of @fields
> > > > + *
> > > > + * Parse the data part of the TLV data format and call the supplie=
d callback
> > > > + * function for each data entry, passing also the opaque data poin=
ter.
> > > > + *
> > > > + * The data callback function decides how to process data dependin=
g on the
> > > > + * field.
> > > > + *
> > > > + * Return: 0 on success, a negative value on error.
> > > > + */
> > > > +static int tlv_parse_data(data_callback data_callback, void *data_=
callback_data,
> > > > +			  __u64 num_entries, const __u8 *data, size_t data_len,
> > > > +			  const char **fields, __u64 num_fields)
> > > > +{
> > > > +	const __u8 *data_ptr =3D data;
> > > > +	struct tlv_data_entry *entry;
> > > > +	__u64 parsed_field, len, i, max_num_entries;
> > > > +	int ret;
> > > > +
> > > > +	max_num_entries =3D data_len / sizeof(*entry);
> > > > +
> > > > +	/* Possibly lower limit on num_entries loop. */
> > > > +	if (num_entries > max_num_entries)
> > > > +		return -EBADMSG;
> > > > +
> > > > +	for (i =3D 0; i < num_entries; i++) {
> > > > +		if (data_len < sizeof(*entry))
> > > > +			return -EBADMSG;
> > > > +
> > > > +		entry =3D (struct tlv_data_entry *)data_ptr;
> > > > +		data_ptr +=3D sizeof(*entry);
> > > > +		data_len -=3D sizeof(*entry);
> > > > +
> > > > +		parsed_field =3D __be64_to_cpu(entry->field);
> > > > +		if (parsed_field >=3D num_fields) {
> > > > +			pr_debug("Invalid field %llu, max: %llu\n",
> > > > +				 parsed_field, num_fields - 1);
> > > > +			return -EBADMSG;
> > > > +		}
> > > > +
> > > > +		len =3D __be64_to_cpu(entry->length);
> > > > +
> > > > +		if (data_len < len)
> > > > +			return -EBADMSG;
> > > > +
> > > > +		pr_debug("Data: field: %s, len: %llu\n", fields[parsed_field],
> > > > +			 len);
> > > > +
> > > > +		if (!len)
> > > > +			continue;
> > > > +
> > > > +		ret =3D data_callback(data_callback_data, parsed_field, data_ptr=
,
> > > > +				    len);
> > > > +		if (ret < 0) {
> > > > +			pr_debug("Parsing of field %s failed, ret: %d\n",
> > > > +				 fields[parsed_field], ret);
> > > > +			return ret;
> > > > +		}
> > > > +
> > > > +		data_ptr +=3D len;
> > > > +		data_len -=3D len;
> > > > +	}
> > > > +
> > > > +	if (data_len) {
> > > > +		pr_debug("Excess data: %lu bytes\n", data_len);
> > > > +		return -EBADMSG;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * tlv_parse - Parse data in TLV format
> > > > + * @hdr_callback: Callback function to call after parsing header
> > > > + * @hdr_callback_data: Opaque data to supply to the header callbac=
k function
> > > > + * @data_callback: Callback function to call to parse the data ent=
ries
> > > > + * @data_callback_data: Opaque data to supply to the data callback=
 function
> > > > + * @data: Data to parse
> > > > + * @data_len: Length of @data
> > > > + * @data_types: Array of data type strings
> > > > + * @num_data_types: Number of elements of @data_types
> > > > + * @fields: Array of field strings
> > > > + * @num_fields: Number of elements of @fields
> > > > + *
> > > > + * Parse data in TLV format and call tlv_parse_data() each time tl=
v_parse_hdr()
> > > > + * returns 1.
> > > > + *
> > > > + * Return: 0 on success, a negative value on error.
> > > > + */
> > > > +int tlv_parse(hdr_callback hdr_callback, void *hdr_callback_data,
> > > > +	      data_callback data_callback, void *data_callback_data,
> > > > +	      const __u8 *data, size_t data_len, const char **data_types,
> > > > +	      __u64 num_data_types, const char **fields, __u64 num_fields=
)
> > > > +{
> > > > +	__u64 parsed_num_entries, parsed_total_len;
> > > > +	const __u8 *data_ptr =3D data;
> > > > +	int ret =3D 0;
> > > > +
> > > > +	pr_debug("Start parsing data blob, size: %lu\n", data_len);
> > > > +
> > > > +	while (data_len) {
> > > > +		ret =3D tlv_parse_hdr(hdr_callback, hdr_callback_data, &data_ptr=
,
> > > > +				    &data_len, &parsed_num_entries,
> > > > +				    &parsed_total_len, data_types,
> > > > +				    num_data_types);
> > > > +		switch (ret) {
> > > > +		case 0:
> > > > +			/*
> > > > +			 * tlv_parse_hdr() already checked that
> > > > +			 * parsed_total_len <=3D data_len.
> > > > +			 */
> > > > +			data_ptr +=3D parsed_total_len;
> > > > +			data_len -=3D parsed_total_len;
> > > > +			continue;
> > > > +		case 1:
> > > > +			break;
> > > > +		default:
> > > > +			goto out;
> > > > +		}
> > > > +
> > > > +		ret =3D tlv_parse_data(data_callback, data_callback_data,
> > > > +				     parsed_num_entries, data_ptr,
> > > > +				     parsed_total_len, fields, num_fields);
> > > > +		if (ret < 0)
> > > > +			goto out;
> > > > +
> > > > +		data_ptr +=3D parsed_total_len;
> > > > +		data_len -=3D parsed_total_len;
> > > > +	}
> > > > +out:
> > > > +	pr_debug("End of parsing data blob, ret: %d\n", ret);
> > > > +	return ret;
> > > > +}
> > > > diff --git a/lib/tlv_parser.h b/lib/tlv_parser.h
> > > > new file mode 100644
> > > > index 000000000000..8fa8127bd13e
> > > > --- /dev/null
> > > > +++ b/lib/tlv_parser.h
> > > > @@ -0,0 +1,17 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +/*
> > > > + * Copyright (C) 2023-2024 Huawei Technologies Duesseldorf GmbH
> > > > + *
> > > > + * Author: Roberto Sassu <roberto.sassu@huawei.com>
> > > > + *
> > > > + * Header file of TLV parser.
> > > > + */
> > > > +
> > > > +#ifndef _LIB_TLV_PARSER_H
> > > > +#define _LIB_TLV_PARSER_H
> > > > +
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/tlv_parser.h>
> > > > +
> > > > +#endif /* _LIB_TLV_PARSER_H */
> > >=20
> >=20
>=20


