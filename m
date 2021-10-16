Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B67D430032
	for <lists+linux-doc@lfdr.de>; Sat, 16 Oct 2021 06:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239493AbhJPE1V (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 16 Oct 2021 00:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhJPE1V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Oct 2021 00:27:21 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF47C061570
        for <linux-doc@vger.kernel.org>; Fri, 15 Oct 2021 21:25:14 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so787275otq.12
        for <linux-doc@vger.kernel.org>; Fri, 15 Oct 2021 21:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ttHG94EZHsD+P+/9KmyJTL/xAboWx2cUCq0Dm+TL3NU=;
        b=R+w2LRSRYENdkhvkNWjsKAWxGt57NB/N4N8xbi6c+vHGHEBqhpAS+4Rk8sDYHLVfMR
         zmhaizi0kxMbakTkwprfIBi1xDq6ZOAwpPbhX/GPEaCqHjr5YMwq26hJkm0a+Yi+jrTn
         mqCJmLZigJwi3b5nrDTpmvOHnb9DeolPZHkmmyL3h6JAbCsEOtpky9RLM/urDuJCJHxK
         lcyUyoLtH3fCPBiVCJ6IHSU9oBqUYbz/73f6Nsa8jcQowYLITQl8vni2442JAp+3/II2
         c4vg+jSas5A1eiy0d5R/Emd6WIGY6IYVSQtoCkmPZO6iG7oebAdAUVHUdpFIpwcV+4lj
         0byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ttHG94EZHsD+P+/9KmyJTL/xAboWx2cUCq0Dm+TL3NU=;
        b=4Ka8CwH7RTbUM5FvFtxmx5j7wUKJUsjoE6u7l0F6ESQdNgnaEqTweBJZkT6elRDd6R
         QjCLs8St7sbJsfllnh265RM9eCGl0bjDo8ksXRF3NcRUZIyWCuhj6IZf4WozMkfJxc5d
         GQwXeSlO+gn4ktT7f3clzv2cAfMMQiGccFQllM1O50l0w6FR4rgEGxQgdQb5Z58AQXq8
         Qlx10ea7u7DPm5yZlqbUWjvcIWJWfd5UMfEVCvhUbffm7E9/495t4EpCr1d0DV5AIlZh
         SBkMX00hRAmGsXZNYKDySunbsMJvBZDYHqhneci6RlE9tKr90DCvROeqTOj1cyh6u+GZ
         fWfg==
X-Gm-Message-State: AOAM531c9srHJEHrsqTOjm3LIaKXcMHvG+6F5HIMqk3rtL5BQzW2NffC
        JYrauY16AWG9M0VoWVpv4CU=
X-Google-Smtp-Source: ABdhPJzaXj6kxCsioYM9QNAdSuNwj04oX+jWf7ddAf9ZefEK8Py8E+4DYiRB2aZHFsdQ6gT+1Y5gLg==
X-Received: by 2002:a05:6830:349d:: with SMTP id c29mr9114214otu.263.1634358311547;
        Fri, 15 Oct 2021 21:25:11 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.34])
        by smtp.gmail.com with ESMTPSA id e23sm1633558oih.40.2021.10.15.21.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 21:25:11 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 1/2] docs/zh_CN: add core-api assoc_array translation
Date:   Sat, 16 Oct 2021 12:24:46 +0800
Message-Id: <860ac85d9a2a83c2b63eb8d1be929ad64280d7b2.1634358018.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634358018.git.siyanteng@loongson.cn>
References: <cover.1634358018.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/assoc_array.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../zh_CN/core-api/assoc_array.rst            | 473 ++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 2 files changed, 474 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/assoc_array.rst

diff --git a/Documentation/translations/zh_CN/core-api/assoc_array.rst b/Documentation/translations/zh_CN/core-api/assoc_array.rst
new file mode 100644
index 000000000000..3649bf0d1488
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/assoc_array.rst
@@ -0,0 +1,473 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/assoc_array.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_core-api_assoc_array:
+
+==================
+通用关联数组的实现
+==================
+
+简介
+====
+
+这个关联数组的实现是一个具有以下属性的对象容器:
+
+1. 对象是不透明的指针。该实现不关心它们指向哪里（如果有的话）或它们指向什么（如果有的
+   话）。
+
+   .. note::
+
+      指向对象的指针 *必须* 在最小有效位为零。
+
+2. 对象不需要包含供数组使用的链接块。这允许一个对象同时位于多个数组中。相反，数组是
+   由指向对象的元数据块组成的。
+
+3. 对象需要索引键来定位它们在阵列中的位置。
+
+4. 索引键必须是唯一的。插入一个与已经在数组中的且具有相同键值的对象将取代旧的对象。
+
+5. 索引键可以是任何长度，也可以是不同的长度。
+
+6. 索引键应该在早期就对长度进行编码，即在任何由于长度引起的变化出现之前。
+
+7. 索引键可以包括一个哈希值，以便将对象分散到整个数组中。
+
+8. 该数组可以迭代。对象不一定会按索引键的顺序出现。
+
+9.  数组可以在被修改的时候进行迭代，只要RCU的读锁被迭代器持有。然而，请注意，在这种情
+    况下，一些对象可能会被看到不止一次。如果这是个问题，迭代器应该锁定以防止修改。然
+    而，除非删除，否则对象不会被错过。
+
+10. 数组中的对象可以通过其索引键进行查询。
+
+11. 当数组被修改时，对象可以被查询，前提是进行查询的线程持有RCU的读锁。
+
+该实现在内部使用了一棵由16个指针节点组成的树，这些节点在每一层都由索引键的小数点进行索
+引，其方式与基数树相同。为了提高内存效率，可以放置快捷键，以跳过本来是一系列单占节点的地
+方。此外，节点将叶子对象指针打包到节点的空闲空间中，而不是做一个额外的分支，直到有对象
+需要被添加到一个完整的节点中。
+
+公用API
+=======
+
+公用API可以在 ``<linux/assoc_array.h>`` 中找到。关联数组的根是以下结构::
+
+    struct assoc_array {
+            ...
+    };
+
+该代码是通过启用 ``CONFIG_ASSOCIATIVE_ARRAY`` 来选择的，以::
+
+    ./script/config -e ASSOCIATIVE_ARRAY
+
+
+编辑脚本
+--------
+
+插入和删除功能会产生一个“编辑脚本”，以后可以应用这个脚本来实现更改，而不会造成 ``ENOMEM``
+风险。这保留了将被安装在内部树中的预分配的元数据块，并跟踪应用脚本时将从树中删除的元数
+据块。
+
+在脚本应用后，这也被用来跟踪死块和死对象，以便以后可以释放它们。释放是在RCU宽限期过后
+进行的--因此允许访问功能在RCU读锁下进行。
+
+脚本在API之外显示为一个类型为::
+
+    struct assoc_array_edit;
+
+有两个处理脚本的功能:
+
+1. 应用一个编辑脚本::
+
+    void assoc_array_apply_edit(struct assoc_array_edit *edit);
+
+这将执行编辑功能，插值各种写屏障，以允许在RCU读锁下的访问继续进行。然后，编辑脚本将被
+传递给 ``call_rcu()`` ，以释放它和它所指向的任何死的东西。
+
+2. Cancel an edit script::
+
+    void assoc_array_cancel_edit(struct assoc_array_edit *edit);
+
+这将立即释放编辑脚本和所有预分配的内存。如果这是为了插入，新的对象不会被这个函数释放，
+而是必须由调用者释放。
+
+这些函数保证不会失败。
+
+
+操作表
+------
+
+各种功能采用了一个操作表::
+
+    struct assoc_array_ops {
+            ...
+    };
+
+这指出了一些方法，所有这些方法都需要提供:
+
+1. 从调用者数据中获取索引键的一个块::
+
+    unsigned long (*get_key_chunk)(const void *index_key, int level);
+
+这应该返回一个由调用者提供的索引键的块，从level参数给出的 *比特* 位置开始。level参数将
+是 ``ASSOC_ARRAY_KEY_CHUNK_SIZE`` 的倍数，该函数应返回 ``ASSOC_ARRAY_KEY_CHUNK_SIZE``
+位。不可能出现错误。
+
+
+2. 获取一个对象的索引键的一个块::
+
+    unsigned long (*get_object_key_chunk)(const void *object, int level);
+
+和前面的函数一样，但是从数组中的一个对象而不是从调用者提供的索引键中获取数据。
+
+
+3. 看看这是否是我们要找的对象::
+
+    bool (*compare_object)(const void *object, const void *index_key);
+
+将对象与一个索引键进行比较，如果匹配则返回 ``true`` ，不匹配则返回 ``false`` 。
+
+
+4. 对两个对象的索引键进行比较::
+
+    int (*diff_objects)(const void *object, const void *index_key);
+
+返回指定对象的索引键与给定索引键不同的比特位置，如果它们相同，则返回-1。
+
+
+5. 释放一个对象::
+
+    void (*free_object)(void *object);
+
+释放指定的对象。注意，这可能是在调用 ``assoc_array_apply_edit()`` 后的一个RCU宽限期内
+调用的，所以在模块卸载时可能需要 ``synchronize_rcu()`` 。
+
+
+操控函数
+--------
+
+有一些函数用于操控关联数组:
+
+1. 初始化一个关联数组::
+
+    void assoc_array_init(struct assoc_array *array);
+
+这将初始化一个关联数组的基础结构。它不会失败。
+
+
+2. 在一个关联数组中插入/替换一个对象::
+
+    struct assoc_array_edit *
+    assoc_array_insert(struct assoc_array *array,
+                       const struct assoc_array_ops *ops,
+                       const void *index_key,
+                       void *object);
+
+这将把给定的对象插入数组中。注意，指针的最小有效位必须是0，因为它被用来在内部标记指针的类
+型。
+
+如果该键已经存在一个对象，那么它将被新的对象所取代，旧的对象将被自动释放。
+
+``index_key`` 参数应持有索引键信息，并在调用OPP表中的方法时传递给它们。
+
+这个函数不对数组本身做任何改动，而是返回一个必须应用的编辑脚本。如果出现内存不足的错误，会
+返回 ``-ENOMEM`` 。
+
+调用者应专门锁定数组的其他修改器。
+
+
+3. 从一个关联数组中删除一个对象::
+
+    struct assoc_array_edit *
+    assoc_array_delete(struct assoc_array *array,
+                       const struct assoc_array_ops *ops,
+                       const void *index_key);
+
+这将从数组中删除一个符合指定数据的对象。
+
+``index_key`` 参数应持有索引键信息，并在调用OPP表中的方法时传递给它们。
+
+这个函数不对数组本身做任何改动，而是返回一个必须应用的编辑脚本。 ``-ENOMEM`` 在出现内存不足
+的错误时返回。如果在数组中没有找到指定的对象，将返回 ``NULL`` 。
+
+调用者应该对数组的其他修改者进行专门锁定。
+
+
+4. 从一个关联数组中删除所有对象::
+
+    struct assoc_array_edit *
+    assoc_array_clear(struct assoc_array *array,
+                      const struct assoc_array_ops *ops);
+
+这个函数删除了一个关联数组中的所有对象，使其完全为空。
+
+这个函数没有对数组本身做任何改动，而是返回一个必须应用的编辑脚本。如果出现内存不足
+的错误，则返回 ``-ENOMEM`` 。
+
+调用者应专门锁定数组的其他修改者。
+
+
+5. 销毁一个关联数组，删除所有对象::
+
+    void assoc_array_destroy(struct assoc_array *array,
+                             const struct assoc_array_ops *ops);
+
+这将破坏关联数组的内容，使其完全为空。在这个函数销毁数组的同时，不允许另一个线程在RCU读锁
+下遍历数组，因为在内存释放时不执行RCU延迟，这需要分配内存。
+
+调用者应该专门针对数组的其他修改者和访问者进行锁定。
+
+
+6. 垃圾回收一个关联数组::
+
+    int assoc_array_gc(struct assoc_array *array,
+                       const struct assoc_array_ops *ops,
+                       bool (*iterator)(void *object, void *iterator_data),
+                       void *iterator_data);
+
+这是对一个关联数组中的对象进行迭代，并将每个对象传递给 ``iterator()`` 。如果 ``iterator()`` 返回
+true，该对象被保留。如果它返回 ``false`` ，该对象将被释放。如果 ``iterator()`` 函数返回 ``true`` ，它必须
+在返回之前对该对象进行适当的 ``refcount`` 递增。
+
+如果可能的话，内部树将被打包下来，作为迭代的一部分，以减少其中的节点数量。
+
+``iterator_data`` 被直接传递给 ``iterator()`` ，否则会被函数忽略。
+
+如果成功，该函数将返回 ``0`` ，如果没有足够的内存，则返回 ``-ENOMEM`` 。
+
+在这个函数执行过程中，其他线程有可能在RCU读锁下迭代或搜索阵列。调用者应该专门针对数组的其他
+修改者进行锁定。
+
+
+访问函数
+--------
+
+有两个函数用于访问一个关联数组:
+
+1. 遍历一个关联数组中的所有对象::
+
+    int assoc_array_iterate(const struct assoc_array *array,
+                            int (*iterator)(const void *object,
+                                            void *iterator_data),
+                            void *iterator_data);
+
+这将数组中的每个对象传递给迭代器回调函数。 ``iterator_data`` 是该函数的私有数据。
+
+在数组被修改的同时，可以在数组上使用这个方法，前提是RCU读锁被持有。在这种情况下，迭代函数有
+可能两次看到某些对象。如果这是个问题，那么修改应该被锁定。然而，迭代算法不应该错过任何对象。
+
+如果数组中没有对象，该函数将返回 ``0`` ，否则将返回最后一次调用的迭代器函数的结果。如果对迭代函数
+的任何调用导致非零返回，迭代立即停止。
+
+
+2. 在一个关联数组中寻找一个对象::
+
+    void *assoc_array_find(const struct assoc_array *array,
+                           const struct assoc_array_ops *ops,
+                           const void *index_key);
+
+这将直接穿过数组的内部树，到达索引键所指定的对象。
+
+这个函数可以在修改数组的同时用在数组上，前提是RCU读锁被持有。
+
+如果找到对象，该函数将返回对象（并将 ``*_type`` 设置为对象的类型），如果没有找到对象，将返回 ``NULL`` 。
+
+
+索引键形式
+----------
+
+索引键可以是任何形式的，但是由于算法没有被告知键有多长，所以强烈建议在任何由于长度而产生的变化
+对比较产生影响之前，索引键应该很早就包括其长度。
+
+这将导致具有不同长度键的叶子相互分散，而具有相同长度键的叶子则聚集在一起。
+
+我们还建议索引键以键的其余部分的哈希值开始，以最大限度地提高整个键空间的散布情况。
+
+分散性越好，内部树就越宽，越低。
+
+分散性差并不是一个太大的问题，因为有快捷键，节点可以包含叶子和元数据指针的混合物。
+
+索引键是以机器字的块状来读取的。每个块被细分为每层一个nibble（4比特），所以在32位CPU上这适合8层，
+在64位CPU上适合16层。除非散布情况真的很差，否则不太可能有超过一个字的任何特定索引键需要被使用。
+
+
+内部工作机制
+============
+
+关联数组数据结构有一个内部树。这个树由两种类型的元数据块构成：节点和快捷键。
+
+一个节点是一个槽的数组。每个槽可以包含以下四种东西之一:
+
+* 一个NULL的指针，表示槽是空的。
+* 一个指向对象（叶子）的指针。
+* 一个指向下一级节点的指针。
+* 一个指向快捷键的指针。
+
+
+基本的内部树形布局
+------------------
+
+暂时不考虑快捷键，节点形成一个多级树。索引键空间被树上的节点严格细分，节点出现在固定的层次上。例如::
+
+ Level: 0               1               2               3
+        =============== =============== =============== ===============
+                                                        NODE D
+                        NODE B          NODE C  +------>+---+
+                +------>+---+   +------>+---+   |       | 0 |
+        NODE A  |       | 0 |   |       | 0 |   |       +---+
+        +---+   |       +---+   |       +---+   |       :   :
+        | 0 |   |       :   :   |       :   :   |       +---+
+        +---+   |       +---+   |       +---+   |       | f |
+        | 1 |---+       | 3 |---+       | 7 |---+       +---+
+        +---+           +---+           +---+
+        :   :           :   :           | 8 |---+
+        +---+           +---+           +---+   |       NODE E
+        | e |---+       | f |           :   :   +------>+---+
+        +---+   |       +---+           +---+           | 0 |
+        | f |   |                       | f |           +---+
+        +---+   |                       +---+           :   :
+                |       NODE F                          +---+
+                +------>+---+                           | f |
+                        | 0 |           NODE G          +---+
+                        +---+   +------>+---+
+                        :   :   |       | 0 |
+                        +---+   |       +---+
+                        | 6 |---+       :   :
+                        +---+           +---+
+                        :   :           | f |
+                        +---+           +---+
+                        | f |
+                        +---+
+
+在上述例子中，有7个节点（A-G），每个节点有16个槽（0-f）。假设树上没有其他元数据节点，那么密钥空间
+是这样划分的::
+
+    KEY PREFIX      NODE
+    ==========      ====
+    137*            D
+    138*            E
+    13[0-69-f]*     C
+    1[0-24-f]*      B
+    e6*             G
+    e[0-57-f]*      F
+    [02-df]*        A
+
+因此，例如，具有以下示例索引键的键将在适当的节点中被找到::
+
+    INDEX KEY       PREFIX  NODE
+    =============== ======= ====
+    13694892892489  13      C
+    13795289025897  137     D
+    13889dde88793   138     E
+    138bbb89003093  138     E
+    1394879524789   12      C
+    1458952489      1       B
+    9431809de993ba  -       A
+    b4542910809cd   -       A
+    e5284310def98   e       F
+    e68428974237    e6      G
+    e7fffcbd443     e       F
+    f3842239082     -       A
+
+为了节省内存，如果一个节点可以容纳它的那部分键空间中的所有叶子，那么这个节点将有所有这些叶子，而不
+会有任何元数据指针——即使其中一些叶子想在同一个槽中。
+
+一个节点可以包含叶子和元数据指针的异质性混合。元数据指针必须在与它们的关键空间的细分相匹配的槽中。
+叶子可以在任何没有被元数据指针占据的槽中。保证一个节点中没有一个叶子会与元数据指针占据的槽相匹配。
+如果元数据指针在那里，任何键与元数据键前缀相匹配的叶必须在元数据指针指向的子树中。
+
+在上面的索引键的例子列表中，节点A将包含::
+
+    SLOT    CONTENT         INDEX KEY (PREFIX)
+    ====    =============== ==================
+    1       PTR TO NODE B   1*
+    any     LEAF            9431809de993ba
+    any     LEAF            b4542910809cd
+    e       PTR TO NODE F   e*
+    any     LEAF            f3842239082
+
+和节点B::
+
+    3	PTR TO NODE C	13*
+    any	LEAF		1458952489
+
+
+快捷键
+---------
+
+快捷键是跳过一块键空间的元数据记录。快捷键是一系列通过层次上升的单占节点的替代物。快捷键的存在是
+为了节省内存和加快遍历速度。
+
+树的根部有可能是一个快捷键——比如说，树至少包含17个节点，都有键前缀 ``1111`` 。插入算法将插入一个快捷键，
+以单次跳过 ``1111`` 的键位，并到达第四层，在这里，这些键位实际上变得不同。
+
+
+拆分和合并节点
+------------------------------
+
+每个节点的最大容量为16个叶子和元数据指针。如果插入算法发现它正试图将一个第17个对象插入到一个节点中，
+该节点将被拆分，使得至少两个在该层有一个共同的关键段的叶子最终在一个单独的节点中，该共同的关键段的根
+在该槽上。
+
+如果一个完整的节点中的叶子和被插入的叶子足够相似，那么就会在树中插入一个快捷键。
+
+当根植于某个节点的子树中的对象数量下降到16个或更少时，那么该子树将被合并成一个单独的节点——如果可能的
+话，这将向根部扩散。
+
+
+非递归式迭代
+------------
+
+每个节点和快捷键都包含一个指向其父节点的后置指针，以及该父节点中指向它的槽数。非递归迭代使用这些来
+通过树的根部进行，前往父节点，槽N+1，以确保在没有堆栈的情况下取得进展。
+
+然而，反向指针使得同时改变和迭代变得很棘手。
+
+
+同时改变和迭代
+--------------
+
+有一些情况需要考虑:
+
+1. 简单的插入/替换。这涉及到简单地将一个NULL或旧的匹配叶子的指针替换为屏障后的新叶子的指针。否则元数
+   据块不会改变。一个旧的叶子直到RCU宽限期过后才会被释放。
+
+2. 简单删除。这只是涉及到清除一个旧的匹配叶子。元数据块不会有其他变化。旧的叶子直到RCU宽限期之后才会
+   被释放。
+
+3. 插入，替换我们还没有进入的子树的一部分。这可能涉及到替换该子树的一部分——但这不会影响迭代，因为我们
+   还没有到达它的指针，而且祖先块也不会被替换（这些块的布局不会改变）。
+
+4. 插入替换了我们正在处理的节点。这不是一个问题，因为我们已经通过了锚定指针，直到我们跟随后面的指针才
+   会切换到新的布局上——这时我们已经检查了被替换节点的叶子（在跟随任何元数据指针之前，我们会迭代一个节
+   点的所有叶子）。
+
+   然而，我们可能会重新看到一些叶子，这些叶子已经被分割成一个新的分支，而这个分支的位置比我们之前的位
+   置更远。
+
+5. 插入替换了我们正在处理的依赖分支的节点。这不会影响到我们，直到我们跟随后面的指针。与（4）类似。
+
+6. 删掉我们下面的一个分支。这不会影响我们，因为在我们看到新节点之前，回溯指针会让我们回到新节点的父节
+   点。整个崩溃的子树被扔掉了，没有任何变化——而且仍然会在同一个槽上生根，所以我们不应该第二次处理它，
+   因为我们会回到槽+1。
+
+.. note::
+
+    在某些情况下，我们需要同时改变一个节点的父指针和父槽指针（比如说，我们在它之前插入了另一个节点，
+    并把它往上移了一层）。我们不能在不锁定读取的情况下这样做——所以我们必须同时替换该节点。
+
+    然而，当我们把一个快捷键改成一个节点时，这不是一个问题，因为快捷键只有一个槽，所以当向后遍
+    历一个槽时，不会使用父槽号。这意味着先改变槽位号是可以的——只要使用适当的屏障来确保父槽位号在后
+    退指针之后被读取。
+
+过时的块和叶子在RCU宽限期过后会被释放，所以只要任何进行遍历或迭代的人持有RCU读锁，旧的上层建筑就不
+应该在他们身上消失。
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 9e03b8d5e3ec..741723011281 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -40,11 +40,11 @@
 
    kobject
    kref
+   assoc_array
 
 Todolist:
 
 
-   assoc_array
    xarray
    idr
    circular-buffers
-- 
2.27.0

