Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9410F529C8E
	for <lists+linux-doc@lfdr.de>; Tue, 17 May 2022 10:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243197AbiEQIcq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 17 May 2022 04:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243140AbiEQIcp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 May 2022 04:32:45 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E1C43480
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 01:32:44 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id a11so16289450pff.1
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mHd014Sv/cZzHNLl2XS0FcsPOA0F2xVdYa0mHdLVxOQ=;
        b=bnrJcO344X5t3ZkCt1ZSG/l5aQuFvZZdLCAlhxNnakNoSpxHL5HM+DMwnDoU4CHJCB
         QkuMDMy4fOR7yRqoeOxfQ7j5vGr7gW9SbHVTOsimcI1crpe1/hEmg0HaTGncvG3L4hTt
         P4vkZVhKl8G3Fgm1u4fK2AAguZHp2ZGN72vipCDJWn6LJWhQWl9SOfUkqvh3bOjbOgoJ
         olrBNI1wZoL4/dP1/vvBdp/eNuM+jGIaE/blJP5lRsKgp6pOZYLj2kyLaqv93x9+bmvY
         fZeBT9cYNkKq23IRbYx74A/w+llEKW3TTYTdLVNWe5R/PKUSV+2hftRwoqdFvMaf69Cv
         y5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mHd014Sv/cZzHNLl2XS0FcsPOA0F2xVdYa0mHdLVxOQ=;
        b=XuM7iigirBSp330tX6zvmoH+KUNh9GB1HDa7a/kY4WsO+3W50QGUrqelvjBw3ZIQG2
         gO1BOEAEbZp+lGhf+wzkgYiCO5xz2SiSihytJ82mkCEBxDTk7e1/MPDMqrN3WSFom9Hx
         y76DQo6IUXbrJYs6IenPdIJL5y+xJGbHRoJi+I9lWY1PiRbdfANPLfkG1j/0MFDTurqx
         HxfsNji6wddBIs9yPPgsCqz5FU+g/341++KXgIyje9dUYQMRCPJU7FPWM2HQmKIJmOEP
         OFupmmxS5ozuJZQNJVcuHLp2Gf+ONRiO8wD2TnUOwCFbr9Ovj4txaaRDAgq9l4BY/P1T
         yYmg==
X-Gm-Message-State: AOAM530VjeV5Kuq91w6j/OC153nBdh6TqICxse+v9djZPObjRl9YC8B5
        1nXCR/+dW3Ulk2OwIwTKrc0fAQ==
X-Google-Smtp-Source: ABdhPJyUwVJJgbOX1VtpusM6TC4Bf0yY494nRFSWFy8ynRdzsv0O2gko9OPqVETRQWTXBoDxFmhhow==
X-Received: by 2002:a63:7d48:0:b0:3db:33fd:b227 with SMTP id m8-20020a637d48000000b003db33fdb227mr19178856pgn.194.1652776364095;
        Tue, 17 May 2022 01:32:44 -0700 (PDT)
Received: from localhost ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b0015e8d4eb22bsm8936923plh.117.2022.05.17.01.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 01:32:43 -0700 (PDT)
Date:   Tue, 17 May 2022 16:32:40 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Oscar Salvador <osalvador@suse.de>
Cc:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        david@redhat.com, masahiroy@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        duanxiongchun@bytedance.com, smuchun@gmail.com
Subject: Re: [PATCH v12 3/7] mm: memory_hotplug: enumerate all supported
 section flags
Message-ID: <YoNdqCz/yYlBNQyM@FVFYT0MHHV2J.usts.net>
References: <20220516102211.41557-1-songmuchun@bytedance.com>
 <20220516102211.41557-4-songmuchun@bytedance.com>
 <YoNTJNfhUO7/oUrn@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoNTJNfhUO7/oUrn@localhost.localdomain>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 17, 2022 at 09:47:48AM +0200, Oscar Salvador wrote:
> On Mon, May 16, 2022 at 06:22:07PM +0800, Muchun Song wrote:
> > We are almost running out of free slots, only one bit is available in the
> 
> I would be more precise about what are we running out of. Free slots of
> what?
> 
> > worst case (powerpc with 256k pages).  However, there are still some free
> > slots on other architectures (e.g. x86_64 has 10 bits available, arm64
> > has 8 bits available with worst case of 64K pages).  We have hard coded
> > those numbers in code, it is inconvenient to use those bits on other
> > architectures except powerpc.  So transfer those section flags to
> > enumeration to make it easy to add new section flags in the future. Also,
> > move SECTION_TAINT_ZONE_DEVICE into the scope of CONFIG_ZONE_DEVICE
> > to save a bit on non-zone-device case.
> > 
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> ...
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -1418,16 +1418,37 @@ extern size_t mem_section_usage_size(void);
> >   *      (equal SECTION_SIZE_BITS - PAGE_SHIFT), and the
> >   *      worst combination is powerpc with 256k pages,
> >   *      which results in PFN_SECTION_SHIFT equal 6.
> > - * To sum it up, at least 6 bits are available.
> > + * To sum it up, at least 6 bits are available on all architectures.
> > + * However, we can exceed 6 bits on some other architectures except
> > + * powerpc (e.g. 15 bits are available on x86_64, 13 bits are available
> > + * with the worst case of 64K pages on arm64) if we make sure the
> > + * exceeded bit is not applicable to powerpc.
> >   */
> > -#define SECTION_MARKED_PRESENT		(1UL<<0)
> > -#define SECTION_HAS_MEM_MAP		(1UL<<1)
> > -#define SECTION_IS_ONLINE		(1UL<<2)
> > -#define SECTION_IS_EARLY		(1UL<<3)
> > -#define SECTION_TAINT_ZONE_DEVICE	(1UL<<4)
> > -#define SECTION_MAP_LAST_BIT		(1UL<<5)
> > +#define ENUM_SECTION_FLAG(MAPPER)						\
> > +	MAPPER(MARKED_PRESENT)							\
> > +	MAPPER(HAS_MEM_MAP)							\
> > +	MAPPER(IS_ONLINE)							\
> > +	MAPPER(IS_EARLY)							\
> > +	MAPPER(TAINT_ZONE_DEVICE, CONFIG_ZONE_DEVICE)				\
> > +	MAPPER(MAP_LAST_BIT)
> > +
> > +#define __SECTION_SHIFT_FLAG_MAPPER_0(x)
> > +#define __SECTION_SHIFT_FLAG_MAPPER_1(x)	SECTION_##x##_SHIFT,
> > +#define __SECTION_SHIFT_FLAG_MAPPER(x, ...)	\
> > +	__PASTE(__SECTION_SHIFT_FLAG_MAPPER_, IS_ENABLED(__VA_ARGS__))(x)
> > +
> > +#define __SECTION_FLAG_MAPPER_0(x)
> > +#define __SECTION_FLAG_MAPPER_1(x)		SECTION_##x = BIT(SECTION_##x##_SHIFT),
> > +#define __SECTION_FLAG_MAPPER(x, ...)		\
> > +	__PASTE(__SECTION_FLAG_MAPPER_, IS_ENABLED(__VA_ARGS__))(x)
> > +
> > +enum {
> > +	ENUM_SECTION_FLAG(__SECTION_SHIFT_FLAG_MAPPER)
> > +	ENUM_SECTION_FLAG(__SECTION_FLAG_MAPPER)
> > +};
> > +
> >  #define SECTION_MAP_MASK		(~(SECTION_MAP_LAST_BIT-1))
> > -#define SECTION_NID_SHIFT		6
> > +#define SECTION_NID_SHIFT		SECTION_MAP_LAST_BIT_SHIFT
> 
> Is this really worth the extra code? And it might be me that I am not
> familiar with all this magic, but it looks overcomplicated.
> Maybe some comments here and there help clarifying what it is going on
> here.
>

Yeah, it's a little complicated. All the magic aims to generate
two enumeration from one MAPPER(xxx, config), one is SECTION_xxx_SHIFT,
another is SECTION_xxx = BIT(SECTION_xxx_SHIFT) if the 'config' is
configured. If we want to add a new flag, like the follow patch, just
one line could do that.

  MAPPER(CANNOT_OPTIMIZE_VMEMMAP, CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP)

Without those magic, we have to add 4 lines like follows to do the
similar thing.

  #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
  	SECTION_CANNOT_OPTIMIZE_VMEMMAP_SHIFT,
  #define SECTION_CANNOT_OPTIMIZE_VMEMMAP BIT(SECTION_CANNOT_OPTIMIZE_VMEMMAP_SHIFT)
  #endif

I admit it is more clear but not simplified as above approach.

Both two approaches are fine to me. If we choose the simplified
one, I agree with you I should add more comments to explain
what happens here.

Thanks.

 
