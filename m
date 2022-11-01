Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743B561481D
	for <lists+linux-doc@lfdr.de>; Tue,  1 Nov 2022 12:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiKALBT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Nov 2022 07:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiKALBS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Nov 2022 07:01:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B59819C03
        for <linux-doc@vger.kernel.org>; Tue,  1 Nov 2022 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667300419;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tUgPMvy3VGkHcduOGHC0NN08qyPSt72BZ+gPr23LqZk=;
        b=IBXqK7w33+EW4+pEkVfOyegsO5Xt/6faTMFHzyMwJBfr5GfY6gHCIdVrutbbGUBuzWOkjM
        Ykbc9mRnDGtpZ2FEOVj0hHi3iASprIYhnTQF6qHIUPPeOM0ytZt6c38VMWeH8IyO/AFWEN
        LaDwzclDbVLE4YrmxLiqV4NqiD1+xlM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-HqMzUg5wNhiRLLYNPtbqEQ-1; Tue, 01 Nov 2022 07:00:18 -0400
X-MC-Unique: HqMzUg5wNhiRLLYNPtbqEQ-1
Received: by mail-qv1-f70.google.com with SMTP id em2-20020ad44f82000000b004af5338777cso7389384qvb.4
        for <linux-doc@vger.kernel.org>; Tue, 01 Nov 2022 04:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUgPMvy3VGkHcduOGHC0NN08qyPSt72BZ+gPr23LqZk=;
        b=s0QyfYbZqMepaB0TBygZo2Fixjr+w5aTCOwUaZ5oLOiWiVmFCSwwn/61pbuIO5DksV
         sShhTr8aye6+BL4aEd5kybnaTrnuRVtfMTRuR1ZifAU8/MPhttUkrulmW/rItzopKqLL
         6Vu5mBmwFgByShOpuhP/vffM5yRRlQbH4nYIpXTOBAJXRxb5onLFfqx0RyZINNYHrVxn
         obEIFslLxz9GuBRAOMwqMur65Mi2IfTQ5V/KE2V9Bo5nFLRLGtxvD++4i0pidokUVlz+
         HYwItMB9q3Qw/P6+hWV59eYbJwypfXJGRvTJrMQ7F58viPiN24gLA8iBnsAvE49UbWJ/
         NWpA==
X-Gm-Message-State: ACrzQf2Om4OJRk9ro/mj/rDZiOtXqEx/xVIsADzGdy8vP8LYC8BtZjPF
        gtk+gYjmheZXxtLHf563Kqmv9Dx9wcYIsS+EQmTuxfj1z8v227tbk2HgYM21JFyM5Cxn7PyfDdo
        PLtVmcY71Y4rubO6/gzCb
X-Received: by 2002:a05:622a:4c8e:b0:3a5:26a5:51d4 with SMTP id ez14-20020a05622a4c8e00b003a526a551d4mr7391704qtb.92.1667300417466;
        Tue, 01 Nov 2022 04:00:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7lu7pC7PKXWeJgg25nKoOsyXZDObeXT8CM27oEjHGETpWGLJhnxME3nRTHJByFL0pfnvkH5g==
X-Received: by 2002:a05:622a:4c8e:b0:3a5:26a5:51d4 with SMTP id ez14-20020a05622a4c8e00b003a526a551d4mr7391691qtb.92.1667300417166;
        Tue, 01 Nov 2022 04:00:17 -0700 (PDT)
Received: from [192.168.0.4] ([78.17.46.82])
        by smtp.gmail.com with ESMTPSA id b13-20020ac812cd000000b0039492d503cdsm4090253qtj.51.2022.11.01.04.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 04:00:16 -0700 (PDT)
Message-ID: <22732cba-8ecc-1c79-a777-3df40c6923bb@redhat.com>
Date:   Tue, 1 Nov 2022 11:00:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH bpf-next v1] bpf, docs: document
 BPF_MAP_TYPE_ARRAY_OF_MAPS and *_HASH_OF_MAPS
Content-Language: en-US
To:     Donald Hunter <donald.hunter@gmail.com>, bpf@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20221010112154.39494-1-donald.hunter@gmail.com>
From:   Maryam Tahhan <mtahhan@redhat.com>
In-Reply-To: <20221010112154.39494-1-donald.hunter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/10/2022 12:21, Donald Hunter wrote:
> Add documentation for the ARRAY_OF_MAPS and HASH_OF_MAPS map types,
> including usage and examples.
> 
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
> ---
>   Documentation/bpf/map_of_maps.rst | 145 ++++++++++++++++++++++++++++++
>   1 file changed, 145 insertions(+)
>   create mode 100644 Documentation/bpf/map_of_maps.rst
> 
> diff --git a/Documentation/bpf/map_of_maps.rst b/Documentation/bpf/map_of_maps.rst
> new file mode 100644
> index 000000000000..16fcda8720de
> --- /dev/null
> +++ b/Documentation/bpf/map_of_maps.rst
> @@ -0,0 +1,145 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +.. Copyright (C) 2022 Red Hat, Inc.
> +
> +========================================================
> +BPF_MAP_TYPE_ARRAY_OF_MAPS and BPF_MAP_TYPE_HASH_OF_MAPS
> +========================================================
> +
> +.. note::
> +   - ``BPF_MAP_TYPE_ARRAY_OF_MAPS`` and ``BPF_MAP_TYPE_HASH_OF_MAPS`` were
> +     introduced in kernel version 4.12.
> +
> +``BPF_MAP_TYPE_ARRAY_OF_MAPS`` and ``BPF_MAP_TYPE_HASH_OF_MAPS`` provide general
> +purpose support for map in map storage. One level of nesting is supported, where
> +an outer map contains instances of a single type of inner map, for example
> +``array_of_maps->sock_map``.
> +
> +When creating an outer map, an inner map instance is used to initialize the
> +metadata that the outer map holds about its inner maps. This inner map has a
> +separate lifetime from the outer map and can be deleted after the outer map has
> +been created.
> +
> +The outer map supports element update and delete from user space using the
> +syscall API. A BPF program is only allowed to do element lookup in the outer
> +map.
> +
> +.. note::
> +   - Multi-level nesting is not supported.
> +   - Any BPF map type can be used as an inner map, except for
> +     ``BPF_MAP_TYPE_PROG_ARRAY``.
> +   - A BPF program cannot update or delete outer map entries.
> +
> +Array of Maps
> +-------------
> +
> +For ``BPF_MAP_TYPE_ARRAY_OF_MAPS`` the key is an unsigned 32-bit integer index
> +into the array. The array is a fixed size with `max_entries` elements that are
> +zero initialized when created.
> +
> +Hash of Maps
> +------------
> +
> +For ``BPF_MAP_TYPE_HASH_OF_MAPS`` the key type can be chosen when defining the
> +map.
> +
> +The kernel is responsible for allocating and freeing key/value pairs, up
> +to the max_entries limit that you specify. Hash maps use pre-allocation
> +of hash table elements by default. The ``BPF_F_NO_PREALLOC`` flag can be
> +used to disable pre-allocation when it is too memory expensive.
> +
> +Usage
> +=====
> +
> +.. c:function::
> +   void *bpf_map_lookup_elem(struct bpf_map *map, const void *key)
> +
> +Inner maps can be retrieved using the ``bpf_map_lookup_elem()`` helper. This
> +helper returns a pointer to the inner map, or ``NULL`` if no entry was found.
> +
> +Examples
> +========
> +
> +Kernel BPF
> +----------
> +
> +This snippet shows how to create an array of devmaps in a BPF program. Note that
> +the outer array can only be modified from user space using the syscall API.
> +
> +.. code-block:: c
> +
> +    struct redirect_map {
> +            __uint(type, BPF_MAP_TYPE_DEVMAP);
> +            __uint(max_entries, 32);
> +            __type(key, enum skb_drop_reason);
> +            __type(value, __u64);
> +    } redirect_map SEC(".maps");
> +
> +    struct {
> +            __uint(type, BPF_MAP_TYPE_ARRAY_OF_MAPS);
> +            __uint(max_entries, 2);
> +            __uint(key_size, sizeof(int));
> +            __uint(value_size, sizeof(int));
> +            __array(values, struct redirect_map);
> +    } outer_map SEC(".maps");
> +
Maybe worth sticking to the same __type declarations in both map structs 
for the key and value params?

Other than that LGTM.

> +This snippet shows how to lookup an outer map to retrieve an inner map.
> +
> +.. code-block:: c
> +
> +    SEC("xdp")
> +    int redirect_by_priority(struct xdp_md *ctx) {
> +            struct bpf_map *devmap;
> +            int action = XDP_PASS;
> +            int index = 0;
> +
> +            devmap = bpf_map_lookup_elem(&outer_arr, &index);
> +            if (!devmap)
> +                    return XDP_PASS;
> +
> +            /* use inner devmap here */
> +
> +            return action;
> +    }
> +
> +User Space
> +----------
> +
> +This snippet shows how to create an array based outer map:
> +
> +.. code-block:: c
> +
> +    int create_outer_array(int inner_fd) {
> +            int fd;
> +            LIBBPF_OPTS(bpf_map_create_opts, opts);
> +            opts.inner_map_fd = inner_fd;
> +            fd = bpf_map_create(BPF_MAP_TYPE_ARRAY_OF_MAPS,
> +                                "example_array",       /* name */
> +                                sizeof(__u32),         /* key size */
> +                                sizeof(__u32),         /* value size */
> +                                256,                   /* max entries */
> +                                &opts);                /* create opts */
> +            return fd;
> +    }
> +
> +
> +This snippet shows how to add an inner map to an outer map:
> +
> +.. code-block:: c
> +
> +    int add_devmap(int outer_fd, int index, const char *name) {
> +            int fd, ret;
> +
> +            fd = bpf_map_create(BPF_MAP_TYPE_DEVMAP, name,
> +                                sizeof(__u32), sizeof(__u32), 256, NULL);
> +            if (fd < 0)
> +                    return fd;
> +
> +            ret = bpf_map_update_elem(outer_fd, &index, &fd, BPF_NOEXIST);
> +            return ret;
> +    }
> +
> +References
> +==========
> +
> +- https://lore.kernel.org/netdev/20170322170035.923581-3-kafai@fb.com/
> +- https://lore.kernel.org/netdev/20170322170035.923581-4-kafai@fb.com/

