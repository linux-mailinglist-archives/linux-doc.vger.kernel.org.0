Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2493057A58E
	for <lists+linux-doc@lfdr.de>; Tue, 19 Jul 2022 19:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiGSRki (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jul 2022 13:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbiGSRkh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 13:40:37 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A22D54069;
        Tue, 19 Jul 2022 10:40:36 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id mf4so28588852ejc.3;
        Tue, 19 Jul 2022 10:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MOSSngbJ0z3lcf48tmRKSi2U1FF0E4dGwt9dmpw2eN8=;
        b=Lk3jRpOPL/krKhXnFHmxOXi4zqyuovUgV+HY55xm9dq5UzqA0tWiPQpKekRTdbqNXB
         TfZrLJD3arck23Msw/bOmJT0DSA9rFTSXocoWPDbLGmZ8I3IoNPHq6BaVLHri3P82hoW
         VQxH2amYVdHaaRKCmWXkv+D0Uy1erCYtRHV0rq2rCygGP2EXZkX/gvXAFwGgdNs9760R
         eScrbtclmXoWHbN7alyEwgi4EE4KP3a7Uk8/pY7of8obuxqkMmXIdpaYNJX5Y2Ma5pcm
         8Cugd18QPws7GDMIY1dypcOLJXQw58fIE4D+T/0O9Lxo0hT0F3xqBKyGywYF0o+vM5Uz
         Y1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MOSSngbJ0z3lcf48tmRKSi2U1FF0E4dGwt9dmpw2eN8=;
        b=Cx1//jevEYlauuIujx/pz1aNCKYc8fgc0hcLRMClldiZb91+s8GJFhiUOjR05yhiTU
         jj2Utxs/m4GKk1xzu/xVujTQTljaZdpmSkxba/ZVu/CWponNoHT5r33EPnHGyBf/oibu
         1OgJE7SG8zQdm002T2OM1j3tKNZF830CLUHPUTyFAw3IFfk4kB27ghCRDDxrFEdCaHGH
         vNDqvoUwFwqp9nkvVwMrnu2wwzbwSdegUGdz+1qvW9zVC9oYIbOyJs2QwN5auVrHUz1F
         kzL2wNa/Fx1AHPG9KnV5QiQDXV6UtXRorzr57YUevO3HBIKokmDwAkqn+gGtQSJCMlLd
         WT9g==
X-Gm-Message-State: AJIora/niwWkVsJ+alxQrhX4azETF6bUBNknEM+K7nqCR+hqgL1biXvw
        KjEmE7XYe6DAyHsNuff95hUrhot6OWgDVziAr3o=
X-Google-Smtp-Source: AGRyM1t5CHF4RVm8eMzDBoraNgUSfBffHuRJOToMSRnC2OsmcyTETqOGrbLeTfJrAG8HEXVqtDhoYSYy0bwAMpil6mg=
X-Received: by 2002:a17:907:6e02:b0:72b:9f16:1bc5 with SMTP id
 sd2-20020a1709076e0200b0072b9f161bc5mr31744075ejc.676.1658252434986; Tue, 19
 Jul 2022 10:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220718125847.1390-1-donald.hunter@gmail.com>
In-Reply-To: <20220718125847.1390-1-donald.hunter@gmail.com>
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date:   Tue, 19 Jul 2022 10:40:23 -0700
Message-ID: <CAADnVQ+JcR-47jvZikwa8XAbqtjUUjEPZ9b8HHdpo-23O1LMOw@mail.gmail.com>
Subject: Re: [PATCH v3] bpf, docs: document BPF_MAP_TYPE_HASH and variants
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     bpf <bpf@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Stanislav Fomichev <sdf@google.com>, Yonghong Song <yhs@fb.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 18, 2022 at 6:02 AM Donald Hunter <donald.hunter@gmail.com> wrote:
>
> Add documentation for BPF_MAP_TYPE_HASH including kernel version
> introduced, usage and examples. Document BPF_MAP_TYPE_PERCPU_HASH,
> BPF_MAP_TYPE_LRU_HASH and BPF_MAP_TYPE_LRU_PERCPU_HASH variations.
>
> Note that this file is included in the BPF documentation by the glob in
> Documentation/bpf/maps.rst
>
> v3:
> Fix typos reported by Stanislav Fomichev and Yonghong Song.
> Add note about iteration and deletion as requested by Yonghong Song.
>
> v2:
> Describe memory allocation semantics as suggested by Stanislav Fomichev.
> Fix u64 typo reported by Stanislav Fomichev.
> Cut down usage examples to only show usage in context.
> Updated patch description to follow style recommendation, reported by
> Bagas Sanjaya.
>
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
> ---
>  Documentation/bpf/map_hash.rst | 186 +++++++++++++++++++++++++++++++++
>  1 file changed, 186 insertions(+)
>  create mode 100644 Documentation/bpf/map_hash.rst
>
> diff --git a/Documentation/bpf/map_hash.rst b/Documentation/bpf/map_hash.rst
> new file mode 100644
> index 000000000000..b1d6562f36ae
> --- /dev/null
> +++ b/Documentation/bpf/map_hash.rst
> @@ -0,0 +1,186 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +.. Copyright (C) 2022 Red Hat, Inc.
> +
> +===============================================
> +BPF_MAP_TYPE_HASH, with PERCPU and LRU Variants
> +===============================================
> +
> +.. note::
> +   - ``BPF_MAP_TYPE_HASH`` was introduced in kernel version 3.19
> +   - ``BPF_MAP_TYPE_PERCPU_HASH`` was introduced in version 4.6
> +   - Both ``BPF_MAP_TYPE_LRU_HASH`` and ``BPF_MAP_TYPE_LRU_PERCPU_HASH``
> +     were introduced in version 4.10
> +
> +``BPF_MAP_TYPE_HASH`` and ``BPF_MAP_TYPE_PERCPU_HASH`` provide general
> +purpose hash map storage. Both the key and the value can be structs,
> +allowing for composite keys and values.
> +
> +The kernel is responsible for allocating and freeing key/value pairs, up
> +to the max_entries limit that you specify. Hash maps use pre-allocation
> +of hash table elements by default. The ``BPF_F_NO_PREALLOC`` flag can be
> +used to disable pre-allocation when it is too memory expensive.
> +
> +``BPF_MAP_TYPE_PERCPU_HASH`` provides a separate value slot per
> +CPU. The per-cpu values are stored internally in an array.
> +
> +The ``BPF_MAP_TYPE_LRU_HASH`` and ``BPF_MAP_TYPE_LRU_PERCPU_HASH``
> +variants add LRU semantics to their respective hash tables. An LRU hash
> +will automatically evict the least recently used entries when the hash
> +table reaches capacity. An LRU hash maintains an internal LRU list that
> +is used to select elements for eviction. This internal LRU list is
> +shared across CPUs but it is possible to request a per CPU LRU list with
> +the ``BPF_F_NO_COMMON_LRU`` flag when calling ``bpf_map_create``.
> +
> +Usage
> +=====
> +
> +.. c:function::
> +   long bpf_map_update_elem(struct bpf_map *map, const void *key, const void *value, u64 flags)
> +
> +Hash entries can be added or updated using the ``bpf_map_update_elem()``
> +helper. This helper replaces existing elements atomically. The ``flags``
> +parameter can be used to control the update behaviour:
> +
> +- ``BPF_ANY`` will create a new element or update an existing element
> +- ``BPF_NOTEXIST`` will create a new element only if one did not already

typo.

> +  exist
> +- ``BPF_EXIST`` will update an existing element
> +
> +``bpf_map_update_elem()`` returns 0 on success, or negative error in
> +case of failure.
> +
> +.. c:function::
> +   void *bpf_map_lookup_elem(struct bpf_map *map, const void *key)
> +
> +Hash entries can be retrieved using the ``bpf_map_lookup_elem()``
> +helper. This helper returns a pointer to the value associated with
> +``key``, or ``NULL`` if no entry was found.
> +
> +.. c:function::
> +   long bpf_map_delete_elem(struct bpf_map *map, const void *key)
> +
> +Hash entries can be deleted using the ``bpf_map_delete_elem()``
> +helper. This helper will return 0 on success, or negative error in case
> +of failure.
> +
> +Per CPU Hashes
> +--------------
> +
> +For ``BPF_MAP_TYPE_PERCPU_HASH`` and ``BPF_MAP_TYPE_LRU_PERCPU_HASH``
> +the ``bpf_map_update_elem()`` and ``bpf_map_lookup_elem()`` helpers
> +automatically access the hash slot for the current CPU.
> +
> +.. c:function::
> +   void *bpf_map_lookup_percpu_elem(struct bpf_map *map, const void *key, u32 cpu)
> +
> +The ``bpf_map_lookup_percpu_elem()`` helper can be used to lookup the
> +value in the hash slot for a specific CPU. Returns value associated with
> +``key`` on ``cpu`` , or ``NULL`` if no entry was found or ``cpu`` is
> +invalid.
> +
> +Concurrency
> +-----------
> +
> +Values stored in ``BPF_MAP_TYPE_HASH`` can be accessed concurrently by
> +programs running on different CPUs.  Since Kernel version 5.1, the BPF
> +infrastructure provides ``struct bpf_spin_lock`` to synchronise access.
> +See ``tools/testing/selftests/bpf/progs/test_spin_lock.c``.
> +
> +Userspace
> +---------
> +
> +.. c:function::
> +   int bpf_map_get_next_key (int fd, const void *cur_key, void *next_key)

unnecessary space.

> +
> +In userspace, it is possible to iterate through the keys of a hash using
> +the ``bpf_map_get_next_key()`` function. The first key can be fetched by

clarified that this is libbpf's function.

> +calling ``bpf_map_get_next_key()`` with ``cur_key`` set to
> +``NULL``. Subsequent calls will fetch the next key that follows the
> +current key. ``bpf_map_get_next_key()`` returns 0 on success, -ENOENT if
> +cur_key is the last key in the hash, or negative error in case of
> +failure.
> +
> +Note that if ``cur_key`` gets deleted then ``bpf_map_get_next_key()``
> +will instead return the *first* key in the hash table which is
> +undesirable. It is recommended to use batched lookup if there is going
> +to be key deletion intermixed with ``bpf_map_get_next_key()``.
> +
> +Examples
> +========
> +
> +Please see the ``tools/testing/selftests/bpf`` directory for functional
> +examples.  The code snippets below demonstrates API usage.
> +
> +This example shows how to declare an LRU Hash with a struct key and a
> +struct value.
> +
> +.. code-block:: c
> +
> +    #include <linux/bpf.h>
> +    #include <bpf/bpf_helpers.h>
> +
> +    struct key {
> +        __u32 srcip;
> +    };
> +
> +    struct value {
> +        __u64 packets;
> +        __u64 bytes;
> +    };
> +
> +    struct {
> +            __uint(type, BPF_MAP_TYPE_LRU_HASH);
> +            __uint(max_entries, 32);
> +            __type(key, struct key);
> +            __type(value, struct value);
> +    } packet_stats SEC(".maps");
> +
> +This example shows how to create or update hash values using atomic
> +instructions:
> +
> +.. code-block:: c
> +
> +    static inline void (__u32 srcip, int bytes)

bug. no name function?

called it 'update_stats' and dropped 'inline',
since it's unnecessary.

> +    {
> +            struct key key = {
> +                    .srcip = srcip

added comma

> +            };
> +            struct value *value = bpf_map_lookup_elem(&packet_stats, &key);

added empty line.

> +            if (value) {
> +                    __sync_fetch_and_add(&value->packets, 1);
> +                    __sync_fetch_and_add(&value->bytes, bytes);
> +            } else {
> +                    struct value newval = { 1, bytes };

added empty line.

> +                    bpf_map_update_elem(&packet_stats, &key, &newval, BPF_NOEXIST);
> +            }
> +    }
> +
> +Userspace walking the map elements from the map declared above:
> +
> +.. code-block:: c
> +
> +    #include <bpf/libbpf.h>
> +    #include <bpf/bpf.h>
> +
> +    static void walk_hash_elements(int map_fd)
> +    {
> +            struct key *cur_key = NULL;
> +            struct key next_key;
> +            int next;

added empty line

> +            do {
> +                    // error checking omitted
> +                    next = bpf_map_get_next_key(stats_fd, cur_key, &next_key);

s/stats_fd/map_fd/

> +                    if (next == -ENOENT)
> +                            break;

converted to if (err) break;
since it's a bad idea to use next_key on any error.
Not just ENOENT.

> +
> +                    struct in_addr src_addr = {
> +                            .s_addr = next_key.srcip
> +                    };

removed. It adds no value. Only confused the reader.

> +                    struct value value;

moved the top

> +                    int ret = bpf_map_lookup_elem(stats_fd, &next_key, &value);

remove 'int ret', since compilers will complain.

> +
> +                    // Use key and value here
> +
> +                    cur_key = &next_key;
> +            } while (next == 0);

converted to 'for (;;)' since 'err == 0' is already checked.

Please pay attention to such details in the future.
The doc shouldn't be sloppy.
